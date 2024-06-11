using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LXP.Common.Entities;
using LXP.Common.ViewModels;

namespace LXP.Core.IServices
{
    public interface IEnrollmentService
    {
        Task<bool> Addenroll(EnrollmentViewModel enrollment);

        object GetCourseandTopicsByLearnerId(Guid learnerId);
    }
}
