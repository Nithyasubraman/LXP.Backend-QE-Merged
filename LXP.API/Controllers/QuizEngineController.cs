//using LXP.Common.ViewModels.QuizEngineViewModel;
//using LXP.Core.IServices;
//using Microsoft.AspNetCore.Mvc;

//[Route("api/[controller]")]
//[ApiController]
//public class QuizEngineController : ControllerBase
//{
//    private readonly IQuizEngineService _quizEngineService;

//    public QuizEngineController(IQuizEngineService quizEngineService)
//    {
//        _quizEngineService = quizEngineService;
//    }


//    [HttpGet("quiz/{quizId}")]
//    public IActionResult GetQuizDetails(Guid quizId)
//    {
//        var quizDetails = _quizEngineService.GetQuizById(quizId);
//        if (quizDetails == null)
//        {
//            return NotFound($"Quiz with ID {quizId} not found.");
//        }
//        return Ok(quizDetails);
//    }
//    [HttpGet("topic/{topicId}/quiz")]
//    public IActionResult GetQuizDetailsByTopicId(Guid topicId)
//    {
//        var quizDetails = _quizEngineService.GetQuizDetailsByTopicId(topicId);
//        if (quizDetails == null)
//        {
//            return NotFound($"No quiz found for topic with ID {topicId}.");
//        }
//        return Ok(quizDetails);
//    }

//    [HttpGet("quiz/{quizId}/questions")]
//    public IActionResult GetQuizQuestions(Guid quizId)
//    {
//        var questions = _quizEngineService.GetQuestionsForQuiz(quizId);
//        return Ok(questions);
//    }


//    [HttpPost("attempt")]
//    public IActionResult StartQuizAttempt(Guid learnerId, Guid quizId)
//    {
//        var attemptId = _quizEngineService.StartQuizAttempt(learnerId, quizId);
//        return Ok(attemptId);
//    }

//    [HttpPost("answer")]
//    public IActionResult SubmitAnswer(AnswerSubmissionModel answerSubmissionModel)
//    {
//        _quizEngineService.SubmitAnswer(answerSubmissionModel);
//        return Ok();


//    }

//    [HttpPost("attempt/submit")]
//    public IActionResult SubmitQuizAttempt(Guid attemptId)
//    {
//        _quizEngineService.SubmitQuizAttempt(attemptId);
//        return Ok();
//    }


//    [HttpGet("attempt/{attemptId}")]
//    public IActionResult GetQuizAttemptDetails(Guid attemptId)
//    {
//        var attemptDetails = _quizEngineService.GetQuizAttemptDetails(attemptId);
//        return Ok(attemptDetails);
//    }

//    [HttpPost("retake")]
//    public IActionResult RetakeQuiz(Guid learnerId, Guid quizId)
//    {
//        var attemptId = _quizEngineService.RetakeQuiz(learnerId, quizId);
//        return Ok(attemptId);
//    }
//}



using LXP.Common.ViewModels.QuizEngineViewModel;
using LXP.Core.IServices;
using Microsoft.AspNetCore.Mvc;



namespace LXP.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QuizEngineController : ControllerBase
    {
        private readonly IQuizEngineService _quizEngineService;

        public QuizEngineController(IQuizEngineService quizEngineService)
        {
            _quizEngineService = quizEngineService;
        }

        [HttpGet("quiz/{quizId}")]
        public async Task<IActionResult> GetQuizDetails(Guid quizId)
        {
            var quizDetails = await _quizEngineService.GetQuizByIdAsync(quizId);
            if (quizDetails == null)
            {
                return NotFound($"Quiz with ID {quizId} not found.");
            }
            return Ok(quizDetails);
        }

        [HttpGet("topic/{topicId}/quiz")]
        public async Task<IActionResult> GetQuizDetailsByTopicId(Guid topicId)
        {
            var quizDetails = await _quizEngineService.GetQuizDetailsByTopicIdAsync(topicId);
            if (quizDetails == null)
            {
                return NotFound($"No quiz found for topic with ID {topicId}.");
            }
            return Ok(quizDetails);
        }

        [HttpGet("quiz/{quizId}/questions")]
        public async Task<IActionResult> GetQuizQuestions(Guid quizId)
        {
            var questions = await _quizEngineService.GetQuestionsForQuizAsync(quizId);
            return Ok(questions);
        }

        [HttpPost("attempt")]
        public async Task<IActionResult> StartQuizAttempt(Guid learnerId, Guid quizId)
        {
            var attemptId = await _quizEngineService.StartQuizAttemptAsync(learnerId, quizId);
            return Ok(attemptId);
        }

        [HttpPost("answer")]
        public async Task<IActionResult> SubmitAnswer(AnswerSubmissionModel answerSubmissionModel)
        {
            await _quizEngineService.SubmitAnswerAsync(answerSubmissionModel);
            return Ok();
        }
        [HttpGet("attempt/{attemptId}/review")]
        public async Task<IActionResult> GetQuizAttemptDetailsForReview(Guid attemptId)
        {
            var attemptDetails = await _quizEngineService.GetQuizAttemptDetailsForReviewAsync(attemptId);
            return Ok(attemptDetails);
        }

        [HttpPost("attempt/submit")]
        public async Task<IActionResult> SubmitQuizAttempt(Guid attemptId)
        {
            await _quizEngineService.SubmitQuizAttemptAsync(attemptId);
            return Ok();
        }

        [HttpGet("attempt/{attemptId}")]
        public async Task<IActionResult> GetQuizAttemptDetails(Guid attemptId)
        {
            var attemptDetails = await _quizEngineService.GetQuizAttemptDetailsAsync(attemptId);
            return Ok(attemptDetails);
        }

        [HttpPost("retake")]
        public async Task<IActionResult> RetakeQuiz(Guid learnerId, Guid quizId)
        {
            var attemptId = await _quizEngineService.RetakeQuizAsync(learnerId, quizId);
            return Ok(attemptId);
        }
    }
}
