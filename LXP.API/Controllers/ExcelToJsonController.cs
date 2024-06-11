// using System;
// using System.Collections.Generic;
// using System.IO;
// using System.Text.Json;
// using System.Threading.Tasks;
// using LXP.Core.IServices;
// using Microsoft.AspNetCore.Http;
// using Microsoft.AspNetCore.Mvc;

// namespace LXP.Api.Controllers
// {
//     /// <summary>
//     /// Manages Excel to JSON conversion operations.
//     /// </summary>
//     [Route("api/[controller]")]
//     [ApiController]
//     public class ExcelToJsonController : BaseController // Inherit from BaseController
//     {
//         private readonly IExcelToJsonService _excelToJsonService;

//         /// <summary>
//         /// Initializes a new instance of the <see cref="ExcelToJsonController"/> class.
//         /// </summary>
//         /// <param name="excelToJsonService">The Excel to JSON service.</param>
//         public ExcelToJsonController(IExcelToJsonService excelToJsonService)
//         {
//             _excelToJsonService = excelToJsonService;
//         }

//         /// <summary>
//         /// Converts an Excel file to JSON format and returns it as a downloadable file.
//         /// </summary>
//         /// <param name="file">The Excel file containing quiz data.</param>
//         /// <returns>The converted JSON data as a downloadable file.</returns>
//         /// <response code="200">JSON data generated successfully.</response>
//         /// <response code="400">Bad request due to invalid input.</response>
//         /// <response code="500">Internal server error.</response>
//         [HttpPost("ConvertExcelToJson")]
//         [ProducesResponseType(typeof(FileContentResult), 200)]
//         [ProducesResponseType(typeof(BadRequestObjectResult), 400)]
//         [ProducesResponseType(typeof(ObjectResult), 500)]
//         public async Task<IActionResult> ConvertExcelToJson(IFormFile file)
//         {
//             if (file == null || file.Length == 0)
//             {
//                 return BadRequest(CreateFailureResponse("The file is required and cannot be empty.", 400));
//             }

//             try
//             {
//                 var jsonData = await _excelToJsonService.ConvertExcelToJsonAsync(file);

//                 var options = new JsonSerializerOptions
//                 {
//                     Encoder = System.Text.Encodings.Web.JavaScriptEncoder.UnsafeRelaxedJsonEscaping,
//                     WriteIndented = true
//                 };

//                 var jsonString = JsonSerializer.Serialize(jsonData, options);
//                 var byteArray = System.Text.Encoding.UTF8.GetBytes(jsonString);
//                 var stream = new MemoryStream(byteArray);

//                 return File(stream, "application/json", "convertedData.json");
//             }
//             catch (Exception ex)
//             {
//                 return StatusCode(
//                     500,
//                     CreateFailureResponse($"An error occurred while converting Excel to JSON: {ex.Message}", 500)
//                 );
//             }
//         }
        
//     }
// }







using LXP.Common.ViewModels.QuizQuestionViewModel;
using LXP.Core.IServices;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Text.Json;
using System.Threading.Tasks;

namespace LXP.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ExcelToJsonController : BaseController // Inherit from BaseController
    {
        private readonly IExcelToJsonService _excelToJsonService;

        public ExcelToJsonController(IExcelToJsonService excelToJsonService)
        {
            _excelToJsonService = excelToJsonService;
        }

        [HttpPost("ConvertExcelToJson")]
        [ProducesResponseType(typeof(FileContentResult), 200)]
        [ProducesResponseType(typeof(BadRequestObjectResult), 400)]
        [ProducesResponseType(typeof(ObjectResult), 500)]
        public async Task<IActionResult> ConvertExcelToJson(IFormFile file, Guid quizId)
        {
            if (file == null || file.Length == 0)
            {
                return BadRequest(CreateFailureResponse("The file is required and cannot be empty.", 400));
            }

            if (quizId == Guid.Empty)
            {
                return BadRequest(CreateFailureResponse("The quiz ID must be a valid GUID.", 400));
            }

            try
            {
                var jsonData = await _excelToJsonService.ConvertExcelToJsonAsync(file);
                await _excelToJsonService.SaveQuizDataAsync(jsonData, quizId);

                var options = new JsonSerializerOptions
                {
                    Encoder = System.Text.Encodings.Web.JavaScriptEncoder.UnsafeRelaxedJsonEscaping,
                    WriteIndented = true
                };

                var jsonString = JsonSerializer.Serialize(jsonData, options);
                var byteArray = System.Text.Encoding.UTF8.GetBytes(jsonString);
                var stream = new MemoryStream(byteArray);

                return File(stream, "application/json", "convertedData.json");
            }
            catch (Exception ex)
            {
                return StatusCode(
                    500,
                    CreateFailureResponse($"An error occurred while converting Excel to JSON: {ex.Message}", 500)
                );
            }
        }
    }
}
