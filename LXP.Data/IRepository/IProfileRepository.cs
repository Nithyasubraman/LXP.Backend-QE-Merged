using LXP.Common.Entities;

namespace LXP.Data.IRepository
{
    public interface IProfileRepository
    {
        public void AddProfile(LearnerProfile learnerprofile);

        Task<List<LearnerProfile>> GetAllLearnerProfile();
        LearnerProfile GetLearnerprofileDetailsByLearnerprofileId(Guid ProfileId);
        Task UpdateProfile(LearnerProfile learnerProfile);
    }
}
