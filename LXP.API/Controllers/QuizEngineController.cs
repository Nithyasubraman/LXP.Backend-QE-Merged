using LXP.Common.ViewModels.QuizEngineViewModel;
using LXP.Core.IServices;
using Microsoft.AspNetCore.Mvc;

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
    public IActionResult GetQuizDetails(Guid quizId)
    {
        var quizDetails = _quizEngineService.GetQuizById(quizId);
        if (quizDetails == null)
        {
            return NotFound($"Quiz with ID {quizId} not found.");
        }
        return Ok(quizDetails);
    }
    [HttpGet("topic/{topicId}/quiz")]
    public IActionResult GetQuizDetailsByTopicId(Guid topicId)
    {
        var quizDetails = _quizEngineService.GetQuizDetailsByTopicId(topicId);
        if (quizDetails == null)
        {
            return NotFound($"No quiz found for topic with ID {topicId}.");
        }
        return Ok(quizDetails);
    }

    [HttpGet("quiz/{quizId}/questions")]
    public IActionResult GetQuizQuestions(Guid quizId)
    {
        var questions = _quizEngineService.GetQuestionsForQuiz(quizId);
        return Ok(questions);
    }


    [HttpPost("attempt")]
    public IActionResult StartQuizAttempt(Guid learnerId, Guid quizId)
    {
        var attemptId = _quizEngineService.StartQuizAttempt(learnerId, quizId);
        return Ok(attemptId);
    }

    [HttpPost("answer")]
    public IActionResult SubmitAnswer(AnswerSubmissionModel answerSubmissionModel)
    {
        _quizEngineService.SubmitAnswer(answerSubmissionModel);
        return Ok();


    }

    [HttpPost("attempt/submit")]
    public IActionResult SubmitQuizAttempt(Guid attemptId)
    {
        _quizEngineService.SubmitQuizAttempt(attemptId);
        return Ok();
    }
    [HttpGet("attempt/{attemptId}/review")]
    public IActionResult ReviewQuizAttemptWithoutCorrectAnswers(Guid attemptId)
    {
        var questionsAndAnswers = _quizEngineService.GetQuestionsAndUserAnswersForAttemptWithoutCorrectAnswers(attemptId);
        if (questionsAndAnswers == null || !questionsAndAnswers.Any())
        {
            return NotFound("No answers found for this attempt.");
        }
        return Ok(questionsAndAnswers);
    }

    [HttpGet("attempt/{attemptId}")]
    public IActionResult GetQuizAttemptDetails(Guid attemptId)
    {
        var attemptDetails = _quizEngineService.GetQuizAttemptDetails(attemptId);
        return Ok(attemptDetails);
    }

    [HttpPost("retake")]
    public IActionResult RetakeQuiz(Guid learnerId, Guid quizId)
    {
        var attemptId = _quizEngineService.RetakeQuiz(learnerId, quizId);
        return Ok(attemptId);
    }

    [HttpGet("attempt/{attemptId}/result")]
    public IActionResult GetQuizAttemptResult(Guid attemptId)
    {
        var result = _quizEngineService.GetQuizAttemptResult(attemptId);
        return Ok(result);
    }





}

























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