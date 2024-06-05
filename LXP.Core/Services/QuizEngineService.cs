using LXP.Common.ViewModels.QuizEngineViewModel;
using LXP.Core.IServices;
using LXP.Data.IRepository;

namespace LXP.Core.Services
{
    public class QuizEngineService : IQuizEngineService
    {
        private readonly IQuizEngineRepository _quizEngineRepository;

        public QuizEngineService(IQuizEngineRepository quizEngineRepository)
        {
            _quizEngineRepository = quizEngineRepository;
        }

        public async Task<ViewQuizDetailsViewModel> GetQuizByIdAsync(Guid quizId)
        {
            return await _quizEngineRepository.GetQuizByIdAsync(quizId);
        }

        public async Task<IEnumerable<QEQuizQuestionViewModel>> GetQuestionsForQuizAsync(Guid quizId)
        {
            return await _quizEngineRepository.GetQuestionsForQuizAsync(quizId);
        }

        public async Task<ViewQuizDetailsViewModel> GetQuizDetailsByTopicIdAsync(Guid topicId)
        {
            return await _quizEngineRepository.GetQuizDetailsByTopicIdAsync(topicId);
        }
        public async Task<LearnerAttemptDetailsViewModel> GetQuizAttemptDetailsForReviewAsync(Guid attemptId)
        {
            var attempt = await _quizEngineRepository.GetLearnerAttemptDetailsForReviewAsync(attemptId);
            if (attempt == null)
                throw new KeyNotFoundException($"Learner attempt with ID {attemptId} not found.");

            return attempt;
        }

        public async Task<Guid> StartQuizAttemptAsync(Guid learnerId, Guid quizId)
        {
            var quiz = await _quizEngineRepository.GetQuizByIdAsync(quizId);
            if (quiz == null)
                throw new KeyNotFoundException($"Quiz with ID {quizId} not found.");

            var isAllowedToAttempt = await _quizEngineRepository.IsAllowedToAttemptQuizAsync(learnerId, quizId);
            if (!isAllowedToAttempt)
            {
                var existingAttempts = await _quizEngineRepository.GetLearnerAttemptsForQuizAsync(learnerId, quizId);
                var passMark = quiz.PassMark;
                var hasPassedQuiz = existingAttempts.Any(a => a.Score >= passMark);

                if (hasPassedQuiz)
                    throw new InvalidOperationException("You have already passed this quiz in a previous attempt.");
                else
                    throw new InvalidOperationException("You have exceeded the maximum number of attempts for this quiz.");
            }

            var startTime = DateTime.UtcNow;
            var attempt = await _quizEngineRepository.CreateLearnerAttemptAsync(learnerId, quizId, startTime);
            return attempt.LearnerAttemptId;
        }

        public async Task SubmitQuizAttemptAsync(Guid attemptId)
        {
            var attempt = await _quizEngineRepository.GetLearnerAttemptByIdAsync(attemptId);
            if (attempt == null)
                throw new KeyNotFoundException($"Learner attempt with ID {attemptId} not found.");
            var quiz = await _quizEngineRepository.GetQuizByIdAsync(attempt.QuizId);
            if (quiz == null)
                throw new KeyNotFoundException($"Quiz with ID {attempt.QuizId} not found.");
            var totalQuestions = (await _quizEngineRepository.GetQuestionsForQuizAsync(quiz.QuizId)).Count();
            var existingAnswers = await _quizEngineRepository.GetLearnerAnswersForAttemptAsync(attemptId);
            if (existingAnswers.Select(a => a.QuizQuestionId).Distinct().Count() != totalQuestions)
                throw new InvalidOperationException("You need to answer all the questions in the quiz before submitting the quiz attempt.");
            var individualQuestionMarks = 100 / totalQuestions;
            float finalScore = 0;
            foreach (var answer in existingAnswers)
            {
                var isAnswerCorrect = await _quizEngineRepository.IsQuestionOptionCorrectAsync(answer.QuizQuestionId, answer.QuestionOptionId);
                var questionScore = await CalculateQuestionScore(answer.QuizQuestionId, isAnswerCorrect, individualQuestionMarks, new AnswerSubmissionModel
                {
                    LearnerAttemptId = attemptId,
                    QuizQuestionId = answer.QuizQuestionId,
                    SelectedOptions = new List<string> { await _quizEngineRepository.GetOptionTextByIdAsync(answer.QuestionOptionId) }
                });
                finalScore += questionScore;
            }
            attempt.Score = (float)Math.Round(finalScore);
            attempt.EndTime = DateTime.UtcNow;
            await _quizEngineRepository.UpdateLearnerAttemptAsync(attempt);
        }

        //public async Task SubmitAnswerAsync(AnswerSubmissionModel answerSubmissionModel)
        //{
        //    var attempt = await _quizEngineRepository.GetLearnerAttemptByIdAsync(answerSubmissionModel.LearnerAttemptId);
        //    if (attempt == null)
        //        throw new KeyNotFoundException($"Learner attempt with ID {answerSubmissionModel.LearnerAttemptId} not found.");
        //    if (DateTime.UtcNow > attempt.EndTime)
        //        throw new InvalidOperationException("Time limit for submitting the quiz has expired.");

        //    var existingAnswers = await _quizEngineRepository.GetLearnerAnswersForAttemptAsync(answerSubmissionModel.LearnerAttemptId);

        //    foreach (var selectedOption in answerSubmissionModel.SelectedOptions)
        //    {
        //        var optionId = await _quizEngineRepository.GetOptionIdByTextAsync(answerSubmissionModel.QuizQuestionId, selectedOption);

        //        var existingAnswer = existingAnswers.FirstOrDefault(a => a.QuizQuestionId == answerSubmissionModel.QuizQuestionId);
        //        if (existingAnswer != null)
        //        {
        //            await _quizEngineRepository.UpdateLearnerAnswerAsync(existingAnswer.LearnerAnswerId, optionId);
        //        }
        //        else
        //        {
        //            await _quizEngineRepository.CreateLearnerAnswerAsync(answerSubmissionModel);
        //        }
        //    }
        //}
        public async Task SubmitAnswerAsync(AnswerSubmissionModel answerSubmissionModel)
        {
            var attempt = await _quizEngineRepository.GetLearnerAttemptByIdAsync(answerSubmissionModel.LearnerAttemptId);
            if (attempt == null)
                throw new KeyNotFoundException($"Learner attempt with ID {answerSubmissionModel.LearnerAttemptId} not found.");
            if (DateTime.UtcNow > attempt.EndTime)
                throw new InvalidOperationException("Time limit for submitting the quiz has expired.");

            var existingAnswers = await _quizEngineRepository.GetLearnerAnswersForAttemptAsync(answerSubmissionModel.LearnerAttemptId);

            var availableOptions = await _quizEngineRepository.GetQuestionOptionsAsync(answerSubmissionModel.QuizQuestionId);
            var availableOptionsIgnoreCase = availableOptions.Select(o => o.ToLower()).ToList();

            foreach (var selectedOption in answerSubmissionModel.SelectedOptions)
            {
                var optionText = selectedOption.ToString();
                var optionTextLower = optionText.ToLower();

                if (!availableOptionsIgnoreCase.Contains(optionTextLower))
                {
                    throw new InvalidOperationException($"The selected option '{optionText}' is not a valid option for the given question.");
                }

                var optionId = await _quizEngineRepository.GetOptionIdByTextAsync(answerSubmissionModel.QuizQuestionId, optionTextLower);

                var existingAnswer = existingAnswers.FirstOrDefault(a => a.QuizQuestionId == answerSubmissionModel.QuizQuestionId);
                if (existingAnswer != null)
                {
                    await _quizEngineRepository.UpdateLearnerAnswerAsync(existingAnswer.LearnerAnswerId, optionId);
                }
                else
                {
                    await _quizEngineRepository.CreateLearnerAnswerAsync(answerSubmissionModel);
                }
            }
        }

        public async Task<LearnerAttemptDetailsViewModel> GetQuizAttemptDetailsAsync(Guid attemptId)
        {
            var attempt = await _quizEngineRepository.GetLearnerAttemptDetailsByIdAsync(attemptId);
            if (attempt == null)
                throw new KeyNotFoundException($"Learner attempt with ID {attemptId} not found.");

            return attempt;
        }

        public async Task<Guid> RetakeQuizAsync(Guid learnerId, Guid quizId)
        {
            var quiz = await _quizEngineRepository.GetQuizByIdAsync(quizId);
            if (quiz == null)
                throw new KeyNotFoundException($"Quiz with ID {quizId} not found.");

            var isAllowedToAttempt = await _quizEngineRepository.IsAllowedToAttemptQuizAsync(learnerId, quizId);
            if (!isAllowedToAttempt)
            {
                var existingAttempts = await _quizEngineRepository.GetLearnerAttemptsForQuizAsync(learnerId, quizId);
                var passMark = quiz.PassMark;
                var hasPassedQuiz = existingAttempts.Any(a => a.Score >= passMark);

                if (hasPassedQuiz)
                    throw new InvalidOperationException("You have already passed this quiz in a previous attempt and cannot retake it.");
                else
                    throw new InvalidOperationException("You have exceeded the maximum number of attempts for this quiz.");
            }

            var startTime = DateTime.UtcNow;
            var attempt = await _quizEngineRepository.CreateLearnerAttemptAsync(learnerId, quizId, startTime);
            return attempt.LearnerAttemptId;
        }


        private async Task<float> CalculateQuestionScore(Guid quizQuestionId, bool isAnswerCorrect, float individualQuestionMarks, AnswerSubmissionModel answerSubmissionModel)
        {
            var questionType = await _quizEngineRepository.GetQuestionTypeByIdAsync(quizQuestionId);
            switch (questionType)
            {
                case "MCQ":
                case "T/F":
                    return isAnswerCorrect ? individualQuestionMarks : 0;

                case "MSQ":
                    var options = await _quizEngineRepository.GetCorrectOptionsForQuestionAsync(quizQuestionId);
                    var correctOptionCount = options.Count();
                    var selectedOptionsCount = answerSubmissionModel.SelectedOptions.Count;
                    var selectedOptions = answerSubmissionModel.SelectedOptions.Select(o => o.ToString()).ToList();
                    var isPartiallyCorrect = selectedOptionsCount > 0 && selectedOptionsCount != correctOptionCount && selectedOptions.Any(o => options.Contains(o));

                    if (isPartiallyCorrect)
                    {
                        var partialMark = (individualQuestionMarks / correctOptionCount) * selectedOptions.Count(o => options.Contains(o));
                        return partialMark;
                    }
                    else
                    {
                        return 0;
                    }

                default:
                    return 0;
            }
        }


    }
}


/*
 * 
 * using LXP.Common.ViewModels.QuizEngineViewModel;
using LXP.Core.IServices;
using LXP.Data.IRepository;

namespace LXP.Core.Services
{
    public class QuizEngineService : IQuizEngineService
    {
        private readonly IQuizEngineRepository _quizEngineRepository;

        private readonly IMemoryCache _cache;

        public QuizEngineService(IQuizEngineRepository quizEngineRepository, IMemoryCache memoryCache)
        {
            _quizEngineRepository = quizEngineRepository;
            _cache = memoryCache;
        }

        public async Task<ViewQuizDetailsViewModel> GetQuizByIdAsync(Guid quizId)
        {
            return await _quizEngineRepository.GetQuizByIdAsync(quizId);
        }

        public async Task<IEnumerable<QEQuizQuestionViewModel>> GetQuestionsForQuizAsync(
            Guid quizId
        )
        {
            return await _quizEngineRepository.GetQuestionsForQuizAsync(quizId);
        }

        public async Task<ViewQuizDetailsViewModel> GetQuizDetailsByTopicIdAsync(Guid topicId)
        {
            return await _quizEngineRepository.GetQuizDetailsByTopicIdAsync(topicId);
        }

        public async Task<Guid> StartQuizAttemptAsync(Guid learnerId, Guid quizId)
        {
            var quiz = await _quizEngineRepository.GetQuizByIdAsync(quizId);
            if (quiz == null)
                throw new KeyNotFoundException($"Quiz with ID {quizId} not found.");

            var isAllowedToAttempt = await _quizEngineRepository.IsAllowedToAttemptQuizAsync(
                learnerId,
                quizId
            );
            if (!isAllowedToAttempt)
            {
                var existingAttempts = await _quizEngineRepository.GetLearnerAttemptsForQuizAsync(
                    learnerId,
                    quizId
                );
                var passMark = quiz.PassMark;
                var hasPassedQuiz = existingAttempts.Any(a => a.Score >= passMark);

                if (hasPassedQuiz)
                    throw new InvalidOperationException(
                        "You have already passed this quiz in a previous attempt."
                    );
                else
                    throw new InvalidOperationException(
                        "You have exceeded the maximum number of attempts for this quiz."
                    );
            }

            var startTime = DateTime.UtcNow;
            var attempt = await _quizEngineRepository.CreateLearnerAttemptAsync(
                learnerId,
                quizId,
                startTime
            );
            return attempt.LearnerAttemptId;
        }
         public async Task SubmitAnswerAsync(AnswerSubmissionModel answerSubmissionModel)
        {
            var attempt = await _quizEngineRepository.GetLearnerAttemptByIdAsync(
                answerSubmissionModel.LearnerAttemptId
            );
            if (attempt == null)
                throw new KeyNotFoundException(
                    $"Learner attempt with ID {answerSubmissionModel.LearnerAttemptId} not found."
                );
            if (DateTime.UtcNow > attempt.EndTime)
                throw new InvalidOperationException(
                    "Time limit for submitting the quiz has expired."
                );

            var cacheKey = $"LearnerAnswers_{answerSubmissionModel.LearnerAttemptId}";
            var learnerAnswers = _cache.GetOrCreate(
                cacheKey,
                entry =>
                {
                    entry.SlidingExpiration = TimeSpan.FromMinutes(
                        attempt.EndTime.Subtract(DateTime.UtcNow).TotalMinutes
                    );
                    return new List<LearnerAnswerDTO>();
                }
            );

            var availableOptions = await _quizEngineRepository.GetQuestionOptionsAsync(
                answerSubmissionModel.QuizQuestionId
            );
            var availableOptionsIgnoreCase = availableOptions.Select(o => o.ToLower()).ToList();

            foreach (var selectedOption in answerSubmissionModel.SelectedOptions)
            {
                var optionText = selectedOption.ToString();
                var optionTextLower = optionText.ToLower();

                if (!availableOptionsIgnoreCase.Contains(optionTextLower))
                {
                    throw new InvalidOperationException(
                        $"The selected option '{optionText}' is not a valid option for the given question."
                    );
                }

                var optionId = await _quizEngineRepository.GetOptionIdByTextAsync(
                    answerSubmissionModel.QuizQuestionId,
                    optionTextLower
                );

                var existingAnswer = learnerAnswers.FirstOrDefault(
                    a => a.QuizQuestionId == answerSubmissionModel.QuizQuestionId
                );
                if (existingAnswer != null)
                {
                    existingAnswer.QuestionOptionId = optionId;
                }
                else
                {
                    learnerAnswers.Add(
                        new LearnerAnswerDTO
                        {
                            LearnerAttemptId = answerSubmissionModel.LearnerAttemptId,
                            QuizQuestionId = answerSubmissionModel.QuizQuestionId,
                            QuestionOptionId = optionId
                        }
                    );
                }
            }

            _cache.Set(
                cacheKey,
                learnerAnswers,
                new MemoryCacheEntryOptions
                {
                    SlidingExpiration = TimeSpan.FromMinutes(
                        attempt.EndTime.Subtract(DateTime.UtcNow).TotalMinutes
                    )
                }
            );
        }

        public async Task SubmitQuizAttemptAsync(Guid attemptId)
        {
            var attempt = await _quizEngineRepository.GetLearnerAttemptByIdAsync(attemptId);
            if (attempt == null)
                throw new KeyNotFoundException($"Learner attempt with ID {attemptId} not found.");
            var quiz = await _quizEngineRepository.GetQuizByIdAsync(attempt.QuizId);
            if (quiz == null)
                throw new KeyNotFoundException($"Quiz with ID {attempt.QuizId} not found.");

            var cacheKey = $"LearnerAnswers_{attemptId}";
            if (!_cache.TryGetValue(cacheKey, out List<LearnerAnswerDTO> learnerAnswers))
                throw new InvalidOperationException(
                    "No answers found for the specified quiz attempt."
                );

            var totalQuestions = (
                await _quizEngineRepository.GetQuestionsForQuizAsync(quiz.QuizId)
            ).Count();
            if (learnerAnswers.Select(a => a.QuizQuestionId).Distinct().Count() != totalQuestions)
                throw new InvalidOperationException(
                    "You need to answer all the questions in the quiz before submitting the quiz attempt."
                );

            var individualQuestionMarks = 100 / totalQuestions;
            float finalScore = 0;

            foreach (var answer in learnerAnswers)
            {
                var isAnswerCorrect = await _quizEngineRepository.IsQuestionOptionCorrectAsync(
                    answer.QuizQuestionId,
                    answer.QuestionOptionId
                );
                var questionScore = await CalculateQuestionScore(
                    answer.QuizQuestionId,
                    isAnswerCorrect,
                    individualQuestionMarks,
                    new AnswerSubmissionModel
                    {
                        LearnerAttemptId = attemptId,
                        QuizQuestionId = answer.QuizQuestionId,
                        SelectedOptions = new List<string>
                        {
                            await _quizEngineRepository.GetOptionTextByIdAsync(
                                answer.QuestionOptionId
                            )
                        }
                    }
                );
                finalScore += questionScore;
            }

            attempt.Score = (float)Math.Round(finalScore);
            attempt.EndTime = DateTime.UtcNow;
            await _quizEngineRepository.UpdateLearnerAttemptAsync(attempt);

            foreach (var answer in learnerAnswers)
            {
                await _quizEngineRepository.CreateLearnerAnswerAsync(
                    new AnswerSubmissionModel
                    {
                        LearnerAttemptId = attemptId,
                        QuizQuestionId = answer.QuizQuestionId,
                        SelectedOptions = new List<string>
                        {
                            await _quizEngineRepository.GetOptionTextByIdAsync(
                                answer.QuestionOptionId
                            )
                        }
                    }
                );
            }

            _cache.Remove(cacheKey);
        }

       

        public async Task<LearnerAttemptDetailsViewModel> GetQuizAttemptDetailsAsync(Guid attemptId)
        {
            var attempt = await _quizEngineRepository.GetLearnerAttemptDetailsByIdAsync(attemptId);
            if (attempt == null)
                throw new KeyNotFoundException($"Learner attempt with ID {attemptId} not found.");

            return attempt;
        }

        public async Task<Guid> RetakeQuizAsync(Guid learnerId, Guid quizId)
        {
            var quiz = await _quizEngineRepository.GetQuizByIdAsync(quizId);
            if (quiz == null)
                throw new KeyNotFoundException($"Quiz with ID {quizId} not found.");

            var isAllowedToAttempt = await _quizEngineRepository.IsAllowedToAttemptQuizAsync(
                learnerId,
                quizId
            );
            if (!isAllowedToAttempt)
            {
                var existingAttempts = await _quizEngineRepository.GetLearnerAttemptsForQuizAsync(
                    learnerId,
                    quizId
                );
                var passMark = quiz.PassMark;
                var hasPassedQuiz = existingAttempts.Any(a => a.Score >= passMark);

                if (hasPassedQuiz)
                    throw new InvalidOperationException(
                        "You have already passed this quiz in a previous attempt and cannot retake it."
                    );
                else
                    throw new InvalidOperationException(
                        "You have exceeded the maximum number of attempts for this quiz."
                    );
            }

            var startTime = DateTime.UtcNow;
            var attempt = await _quizEngineRepository.CreateLearnerAttemptAsync(
                learnerId,
                quizId,
                startTime
            );
            return attempt.LearnerAttemptId;
        }

        private async Task<float> CalculateQuestionScore(
            Guid quizQuestionId,
            bool isAnswerCorrect,
            float individualQuestionMarks,
            AnswerSubmissionModel answerSubmissionModel
        )
        {
            var questionType = await _quizEngineRepository.GetQuestionTypeByIdAsync(quizQuestionId);
            switch (questionType)
            {
                case "MCQ":
                case "T/F":
                    return isAnswerCorrect ? individualQuestionMarks : 0;

                case "MSQ":
                    var options = await _quizEngineRepository.GetCorrectOptionsForQuestionAsync(
                        quizQuestionId
                    );
                    var correctOptionCount = options.Count();
                    var selectedOptionsCount = answerSubmissionModel.SelectedOptions.Count;
                    var selectedOptions = answerSubmissionModel.SelectedOptions
                        .Select(o => o.ToString())
                        .ToList();
                    var isPartiallyCorrect =
                        selectedOptionsCount > 0
                        && selectedOptionsCount != correctOptionCount
                        && selectedOptions.Any(o => options.Contains(o));

                    if (isPartiallyCorrect)
                    {
                        var partialMark =
                            (individualQuestionMarks / correctOptionCount)
                            * selectedOptions.Count(o => options.Contains(o));
                        return partialMark;
                    }
                    else
                    {
                        return 0;
                    }

                default:
                    return 0;
            }
        }
    }
}
*/
















//using LXP.Common.ViewModels.QuizEngineViewModel;
//using LXP.Core.IServices;
//using LXP.Data.IRepository;

//namespace LXP.Core.Services
//{
//    public class QuizEngineService : IQuizEngineService
//    {
//        private readonly IQuizEngineRepository _quizEngineRepository;

//        public QuizEngineService(IQuizEngineRepository quizEngineRepository)
//        {
//            _quizEngineRepository = quizEngineRepository;
//        }
//        public ViewQuizDetailsViewModel GetQuizById(Guid quizId)
//        {
//            return _quizEngineRepository.GetQuizById(quizId);
//        }

//        public IEnumerable<QEQuizQuestionViewModel> GetQuestionsForQuiz(Guid quizId)
//        {
//            return _quizEngineRepository.GetQuestionsForQuiz(quizId);
//        }
//        public ViewQuizDetailsViewModel GetQuizDetailsByTopicId(Guid topicId)
//        {
//            return _quizEngineRepository.GetQuizDetailsByTopicId(topicId);
//        }

//        public Guid StartQuizAttempt(Guid learnerId, Guid quizId)
//        {
//            var quiz = _quizEngineRepository.GetQuizById(quizId);
//            if (quiz == null)
//                throw new KeyNotFoundException($"Quiz with ID {quizId} not found.");

//            var isAllowedToAttempt = _quizEngineRepository.IsAllowedToAttemptQuiz(learnerId, quizId);
//            if (!isAllowedToAttempt)
//            {
//                var existingAttempts = _quizEngineRepository.GetLearnerAttemptsForQuiz(learnerId, quizId);
//                var passMark = quiz.PassMark;
//                var hasPassedQuiz = existingAttempts.Any(a => a.Score >= passMark);

//                if (hasPassedQuiz)
//                    throw new InvalidOperationException("You have already passed this quiz in a previous attempt.");
//                else
//                    throw new InvalidOperationException("You have exceeded the maximum number of attempts for this quiz.");
//            }

//            var startTime = DateTime.UtcNow; // Start time is calculated here
//            var attempt = _quizEngineRepository.CreateLearnerAttempt(learnerId, quizId, startTime);
//            return attempt.LearnerAttemptId;
//        }






//        //public void SubmitQuizAttempt(Guid attemptId)
//        //{
//        //    var attempt = _quizEngineRepository.GetLearnerAttemptById(attemptId);
//        //    if (attempt == null)
//        //        throw new KeyNotFoundException($"Learner attempt with ID {attemptId} not found.");

//        //    var quiz = _quizEngineRepository.GetQuizById(attempt.QuizId);
//        //    if (quiz == null)
//        //        throw new KeyNotFoundException($"Quiz with ID {attempt.QuizId} not found.");

//        //    var totalQuestions = _quizEngineRepository.GetQuestionsForQuiz(quiz.QuizId).Count();
//        //    var individualQuestionMarks = 100 / totalQuestions;


//        //    var existingAnswers = _quizEngineRepository.GetLearnerAnswersForAttempt(attemptId);

//        //    float finalScore = 0;
//        //    foreach (var answer in existingAnswers)
//        //    {
//        //        var isAnswerCorrect = _quizEngineRepository.IsQuestionOptionCorrect(answer.QuizQuestionId, answer.QuestionOptionId);
//        //        var questionScore = CalculateQuestionScore(answer.QuizQuestionId, isAnswerCorrect, individualQuestionMarks, new AnswerSubmissionModel
//        //        {
//        //            LearnerAttemptId = attemptId,
//        //            QuizQuestionId = answer.QuizQuestionId,
//        //            SelectedOptions = new List<string> { _quizEngineRepository.GetOptionTextById(answer.QuestionOptionId) }
//        //        });

//        //        finalScore += questionScore;
//        //    }

//        //    attempt.Score = (float)Math.Round(finalScore);
//        //    attempt.EndTime = DateTime.UtcNow;
//        //    _quizEngineRepository.UpdateLearnerAttempt(attempt);
//        //}
//        public void SubmitQuizAttempt(Guid attemptId)
//        {
//            var attempt = _quizEngineRepository.GetLearnerAttemptById(attemptId);
//            if (attempt == null)
//                throw new KeyNotFoundException($"Learner attempt with ID {attemptId} not found.");

//            var quiz = _quizEngineRepository.GetQuizById(attempt.QuizId);
//            if (quiz == null)
//                throw new KeyNotFoundException($"Quiz with ID {attempt.QuizId} not found.");

//            var totalQuestions = _quizEngineRepository.GetQuestionsForQuiz(quiz.QuizId).Count();
//            var existingAnswers = _quizEngineRepository.GetLearnerAnswersForAttempt(attemptId);

//            // Check if the learner has answered all questions
//            if (existingAnswers.Select(a => a.QuizQuestionId).Distinct().Count() != totalQuestions)
//                throw new InvalidOperationException("You need to answer all the questions in the quiz before submitting the quiz attempt.");

//            var individualQuestionMarks = 100 / totalQuestions;
//            float finalScore = 0;

//            foreach (var answer in existingAnswers)
//            {
//                var isAnswerCorrect = _quizEngineRepository.IsQuestionOptionCorrect(answer.QuizQuestionId, answer.QuestionOptionId);
//                var questionScore = CalculateQuestionScore(answer.QuizQuestionId, isAnswerCorrect, individualQuestionMarks, new AnswerSubmissionModel
//                {
//                    LearnerAttemptId = attemptId,
//                    QuizQuestionId = answer.QuizQuestionId,
//                    SelectedOptions = new List<string> { _quizEngineRepository.GetOptionTextById(answer.QuestionOptionId) }
//                });

//                finalScore += questionScore;
//            }

//            attempt.Score = (float)Math.Round(finalScore);
//            attempt.EndTime = DateTime.UtcNow;
//            _quizEngineRepository.UpdateLearnerAttempt(attempt);
//        }

//        //public void SubmitAnswer(AnswerSubmissionModel answerSubmissionModel)
//        //{
//        //    var attempt = _quizEngineRepository.GetLearnerAttemptById(answerSubmissionModel.LearnerAttemptId);
//        //    if (attempt == null)
//        //        throw new KeyNotFoundException($"Learner attempt with ID {answerSubmissionModel.LearnerAttemptId} not found.");
//        //    if (DateTime.UtcNow > attempt.EndTime)
//        //        throw new InvalidOperationException("Time limit for submitting the quiz has expired.");

//        //    var quiz = _quizEngineRepository.GetQuizById(attempt.QuizId);
//        //    var totalQuestions = _quizEngineRepository.GetQuestionsForQuiz(quiz.QuizId).Count();
//        //    var answeredQuestions = _quizEngineRepository.GetLearnerAnswersForAttempt(answerSubmissionModel.LearnerAttemptId).Select(a => a.QuizQuestionId).Distinct().Count();

//        //    if (answeredQuestions < totalQuestions)
//        //    {
//        //        throw new InvalidOperationException("You need to answer all the questions in the quiz before submitting the quiz attempt.");
//        //    }

//        //    var individualQuestionMarks = 100 / totalQuestions;

//        //    var existingAnswers = _quizEngineRepository.GetLearnerAnswersForAttempt(answerSubmissionModel.LearnerAttemptId);

//        //    foreach (var selectedOption in answerSubmissionModel.SelectedOptions)
//        //    {
//        //        var optionId = _quizEngineRepository.GetOptionIdByText(answerSubmissionModel.QuizQuestionId, selectedOption);

//        //        // Check if the user has already submitted an answer for this question
//        //        var existingAnswer = existingAnswers.FirstOrDefault(a => a.QuizQuestionId == answerSubmissionModel.QuizQuestionId);
//        //        if (existingAnswer != null)
//        //        {
//        //            // Update the existing answer with the new selected option
//        //            _quizEngineRepository.UpdateLearnerAnswer(existingAnswer.LearnerAnswerId, optionId);
//        //        }
//        //        else
//        //        {
//        //            // Create a new learner answer
//        //            var isAnswerCorrect = _quizEngineRepository.IsQuestionOptionCorrect(answerSubmissionModel.QuizQuestionId, optionId);
//        //            var learnerAnswer = _quizEngineRepository.CreateLearnerAnswer(new AnswerSubmissionModel
//        //            {
//        //                LearnerAttemptId = answerSubmissionModel.LearnerAttemptId,
//        //                QuizQuestionId = answerSubmissionModel.QuizQuestionId,
//        //                SelectedOptions = new List<string> { selectedOption }
//        //            });

//        //            var questionScore = CalculateQuestionScore(answerSubmissionModel.QuizQuestionId, isAnswerCorrect, individualQuestionMarks, answerSubmissionModel);
//        //            attempt.Score += questionScore;
//        //        }
//        //    }

//        //    attempt.Score = (float)Math.Round(attempt.Score);
//        //    attempt.EndTime = DateTime.UtcNow;
//        //    _quizEngineRepository.UpdateLearnerAttempt(attempt);
//        //}
//        public void SubmitAnswer(AnswerSubmissionModel answerSubmissionModel)
//        {
//            var attempt = _quizEngineRepository.GetLearnerAttemptById(answerSubmissionModel.LearnerAttemptId);
//            if (attempt == null)
//                throw new KeyNotFoundException($"Learner attempt with ID {answerSubmissionModel.LearnerAttemptId} not found.");
//            if (DateTime.UtcNow > attempt.EndTime)
//                throw new InvalidOperationException("Time limit for submitting the quiz has expired.");

//            var existingAnswers = _quizEngineRepository.GetLearnerAnswersForAttempt(answerSubmissionModel.LearnerAttemptId);

//            foreach (var selectedOption in answerSubmissionModel.SelectedOptions)
//            {
//                var optionId = _quizEngineRepository.GetOptionIdByText(answerSubmissionModel.QuizQuestionId, selectedOption);

//                // Check if the user has already submitted an answer for this question
//                var existingAnswer = existingAnswers.FirstOrDefault(a => a.QuizQuestionId == answerSubmissionModel.QuizQuestionId);
//                if (existingAnswer != null)
//                {
//                    // Update the existing answer with the new selected option
//                    _quizEngineRepository.UpdateLearnerAnswer(existingAnswer.LearnerAnswerId, optionId);
//                }
//                else
//                {

//                    _quizEngineRepository.CreateLearnerAnswer(answerSubmissionModel);
//                }
//            }
//        }






//        public LearnerAttemptDetailsViewModel GetQuizAttemptDetails(Guid attemptId)
//        {
//            var attempt = _quizEngineRepository.GetLearnerAttemptDetailsById(attemptId);
//            if (attempt == null)
//                throw new KeyNotFoundException($"Learner attempt with ID {attemptId} not found.");

//            return attempt;
//        }



//        public Guid RetakeQuiz(Guid learnerId, Guid quizId)
//        {
//            var quiz = _quizEngineRepository.GetQuizById(quizId);
//            if (quiz == null)
//                throw new KeyNotFoundException($"Quiz with ID {quizId} not found.");

//            var isAllowedToAttempt = _quizEngineRepository.IsAllowedToAttemptQuiz(learnerId, quizId);
//            if (!isAllowedToAttempt)
//            {
//                var existingAttempts = _quizEngineRepository.GetLearnerAttemptsForQuiz(learnerId, quizId);
//                var passMark = quiz.PassMark;
//                var hasPassedQuiz = existingAttempts.Any(a => a.Score >= passMark);

//                if (hasPassedQuiz)
//                    throw new InvalidOperationException("You have already passed this quiz in a previous attempt and cannot retake it.");
//                else
//                    throw new InvalidOperationException("You have exceeded the maximum number of attempts for this quiz.");
//            }

//            var startTime = DateTime.UtcNow;
//            var attempt = _quizEngineRepository.CreateLearnerAttempt(learnerId, quizId, startTime);
//            return attempt.LearnerAttemptId;
//        }
//        private float CalculateQuestionScore(Guid quizQuestionId, bool isAnswerCorrect, float individualQuestionMarks, AnswerSubmissionModel answerSubmissionModel)
//        {
//            var questionType = _quizEngineRepository.GetQuestionTypeById(quizQuestionId);
//            switch (questionType)
//            {
//                case "MCQ":
//                case "T/F":
//                    return isAnswerCorrect ? individualQuestionMarks : 0;

//                case "MSQ":
//                    var options = _quizEngineRepository.GetCorrectOptionsForQuestion(quizQuestionId);
//                    var correctOptionCount = options.Count();
//                    var selectedOptionsCount = answerSubmissionModel.SelectedOptions.Count;
//                    var isPartiallyCorrect = selectedOptionsCount > 0 && selectedOptionsCount != correctOptionCount && answerSubmissionModel.SelectedOptions.Any(o => options.Contains(o));

//                    if (isPartiallyCorrect)
//                    {

//                        var partialMark = (individualQuestionMarks / correctOptionCount) * answerSubmissionModel.SelectedOptions.Count(o => options.Contains(o));
//                        return partialMark;
//                    }
//                    else
//                    {
//                        return 0;
//                    }

//                default:
//                    return 0;
//            }
//        }
//    }
//}





