using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LXP.Common.Entities;
using LXP.Common.ViewModels;

namespace LXP.Core.IServices
{
    public interface IMaterialServices
    {
        Task<List<MaterialListViewModel>> GetAllMaterialDetailsByTopicAndType(
            string topicId,
            string materialTypeId
        ); // get
        Task<MaterialListViewModel> AddMaterial(MaterialViewModel material);
        Task<MaterialListViewModel> GetMaterialByMaterialNameAndTopic(
            string materialName,
            string topicId
        );
    }
}
