using LXP.Common.Entities;
using LXP.Common.ViewModels.QuizViewModel;
using LXP.Core.IServices;
using LXP.Data.IRepository;

namespace LXP.Core.Services
{
    public class QuizService : IQuizService
    {
        private readonly IQuizRepository _quizRepository;

        public QuizService(IQuizRepository quizRepository)
        {
            _quizRepository = quizRepository;
        }

        public void CreateQuiz(QuizViewModel quiz, Guid topicId)
        {
            var topic = _quizRepository.GetTopicById(topicId);
            if (topic == null)
                throw new Exception($"Topic with id {topicId} not found.");

            var courseId = topic.CourseId;

            
            var existingQuiz = _quizRepository.GetQuizByTopicId(topicId);
            if (existingQuiz != null)
                throw new Exception($"A quiz already exists for the topic with id {topicId}.");

            ValidateQuiz(quiz);

            var quizEntity = new Quiz
            {
                QuizId = quiz.QuizId,
                CourseId = courseId,
                TopicId = topicId,
                NameOfQuiz = quiz.NameOfQuiz,
                Duration = quiz.Duration,
                PassMark = quiz.PassMark,
                AttemptsAllowed = quiz.AttemptsAllowed,
                CreatedBy = quiz.CreatedBy,
                CreatedAt = quiz.CreatedAt
            };

            _quizRepository.AddQuiz(quizEntity);
        }

        public void UpdateQuiz(QuizViewModel quiz)
        {
            ValidateQuiz(quiz);

            var quizEntity = _quizRepository.GetQuizById(quiz.QuizId);
            if (quizEntity != null)
            {
                quizEntity.NameOfQuiz = quiz.NameOfQuiz;
                quizEntity.Duration = quiz.Duration;
                quizEntity.PassMark = quiz.PassMark;
                quizEntity.AttemptsAllowed = quiz.AttemptsAllowed;

                _quizRepository.UpdateQuiz(quizEntity);
            }
        }

        public void DeleteQuiz(Guid quizId)
        {
            var quizEntity = _quizRepository.GetQuizById(quizId);
            if (quizEntity != null)
            {
                _quizRepository.DeleteQuiz(quizEntity);
            }
        }

        public IEnumerable<QuizViewModel> GetAllQuizzes()
        {
            return _quizRepository.GetAllQuizzes()
                .Select(q => new QuizViewModel
                {
                    QuizId = q.QuizId,
                     CourseId = q.CourseId,
                     TopicId =  q.TopicId,
                    NameOfQuiz = q.NameOfQuiz,
                    Duration = q.Duration,
                    PassMark = q.PassMark,
                    AttemptsAllowed = q.AttemptsAllowed
                })
                .ToList();
        }

        public QuizViewModel GetQuizById(Guid quizId)
        {
            var quiz = _quizRepository.GetQuizById(quizId);
            if (quiz == null)
                return null;

            return new QuizViewModel
            {
                QuizId = quiz.QuizId,
                CourseId= quiz.CourseId,
                TopicId= quiz.TopicId,
                NameOfQuiz = quiz.NameOfQuiz,
                Duration = quiz.Duration,
                PassMark = quiz.PassMark,
                AttemptsAllowed = quiz.AttemptsAllowed
            };
        }

        public Guid? GetQuizIdByTopicId(Guid topicId)
        {
            var quiz = _quizRepository.GetQuizByTopicId(topicId);
            return quiz?.QuizId;
        }

        private void ValidateQuiz(QuizViewModel quiz)
        {
            if (string.IsNullOrWhiteSpace(quiz.NameOfQuiz))
                throw new Exception("NameOfQuiz cannot be null or empty.");
            if (quiz.Duration <= 0)
                throw new Exception("Duration must be a positive integer.");
            if (quiz.PassMark <= 0)
                throw new Exception("PassMark must be a positive integer.");
            if (quiz.AttemptsAllowed.HasValue && quiz.AttemptsAllowed <= 0)
                throw new Exception("AttemptsAllowed must be null or a positive integer.");
        }
    }
}

