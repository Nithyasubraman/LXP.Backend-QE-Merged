using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LXP.Common.Entities;
using LXP.Common.ViewModels;

namespace LXP.Core.IServices
{
    public interface ICourseServices
    {
        Course GetCourseByCourseId(string courseId);
        bool AddCourse(CourseViewModel course);

        IEnumerable<CourseListViewModel> GetAllCourseDetails();
    }
}
