﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LXP.Core.IServices;
using LXP.Data.IRepository;

namespace LXP.Core.Services
{
    public class PasswordHistoryService : IPasswordHistoryService
    {
        private readonly IPasswordHistoryRepository _passwordHistoryRepository;
        private readonly ILearnerRepository _learnerRepository; // Add this line

        public PasswordHistoryService(
            IPasswordHistoryRepository passwordHistoryRepository,
            ILearnerRepository learnerRepository
        ) // Modify this line
        {
            _passwordHistoryRepository = passwordHistoryRepository;
            _learnerRepository = learnerRepository; // Add this line
        }

        public async Task<bool> UpdatePassword(
            string learnerId,
            string oldPassword,
            string newPassword
        )
        {
            var passwordHistory = await _passwordHistoryRepository.GetPasswordHistory(
                Guid.Parse(learnerId)
            );
            var oldPasswordHash = HashPassword(oldPassword);
            if (passwordHistory.NewPassword != oldPasswordHash)
            {
                return false;
            }
            passwordHistory.OldPassword = passwordHistory.NewPassword;
            var newPasswordHash = HashPassword(newPassword);
            passwordHistory.NewPassword = newPasswordHash;
            await _passwordHistoryRepository.UpdatePasswordHistory(passwordHistory);

            var learner = _learnerRepository.GetLearnerDetailsByLearnerId(Guid.Parse(learnerId));
            learner.Password = newPasswordHash;
            _learnerRepository.UpdateLearner(learner);

            return true;
        }

        private string HashPassword(string password)
        {
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                var hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
            }
        }

        private string SomeHashFunction(string password)
        {
            throw new NotImplementedException();
        }
    }
}
