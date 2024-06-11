using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using LXP.Common.Entities;
using LXP.Common.ViewModels;
using LXP.Core.IServices;
using LXP.Data.IRepository;

namespace LXP.Core.Services
{
    public class CategoryServices : ICategoryServices
    {
        private readonly ICategoryRepository _categoryRepository;
        private Mapper _categoryMapper;

        public CategoryServices(ICategoryRepository categoryRepository)
        {
            _categoryRepository = categoryRepository;
            var _configCategory = new MapperConfiguration(cfg =>
                cfg.CreateMap<CourseCategory, CourseCategoryListViewModel>().ReverseMap()
            );
            _categoryMapper = new Mapper(_configCategory);
        }

        public async Task<bool> AddCategory(CourseCategoryViewModel category)
        {
            bool isCategoryExists = await _categoryRepository.AnyCategoryByCategoryName(
                category.Category
            );
            if (isCategoryExists)
            {
                return false;
            }
            else
            {
                CourseCategory courseCategory = new CourseCategory()
                {
                    CategoryId = Guid.NewGuid(),
                    Category = category.Category,
                    CreatedAt = DateTime.Now,
                    CreatedBy = category.CreatedBy
                };
                _categoryRepository.AddCategory(courseCategory);
                return true;
            }
        }

        public async Task<List<CourseCategoryListViewModel>> GetAllCategory()
        {
            List<CourseCategoryListViewModel> category = _categoryMapper.Map<
                List<CourseCategory>,
                List<CourseCategoryListViewModel>
            >(await _categoryRepository.GetAllCategory());
            return category;
        }
    }
}
