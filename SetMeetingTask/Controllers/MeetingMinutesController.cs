using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using SetMeetingTask.Models;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace SetMeetingTask.Controllers
{
    public class MeetingMinutesController : Controller
    {
        private readonly string _connectionString;
        private readonly DataAccessLayer _dataAccessLayer;

        public MeetingMinutesController(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
            _dataAccessLayer = new DataAccessLayer(configuration); // Pass the IConfiguration instance
        }


        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> GetCustomers(string customerType)
        {
            var customers = new List<string>();

            string tableName = customerType == "Corporate" ? "Corporate_Customer_Tbl" : "Individual_Customer_Tbl";

            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                var command = new SqlCommand($"SELECT CustomerName FROM {tableName}", connection);
                using (var reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        customers.Add(reader.GetString(0));
                    }
                }
            }

            return Json(customers);
        }

        [HttpGet]
        public async Task<IActionResult> GetUnit(string productName)
        {
            string unit = "";

            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                var command = new SqlCommand("SELECT Unit FROM Products_Service_Tbl WHERE ProductName = @ProductName", connection);
                command.Parameters.AddWithValue("@ProductName", productName);
                var result = await command.ExecuteScalarAsync();
                if (result != null)
                {
                    unit = result.ToString();
                }
            }

            return Json(unit);
        }

        [HttpGet]
        public async Task<IActionResult> GetAllProducts()
        {
            var products = new List<string>();

            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                var command = new SqlCommand("SELECT ProductName FROM Products_Service_Tbl", connection);
                using (var reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        products.Add(reader.GetString(0));
                    }
                }
            }

            return Json(products);
        }

        [HttpPost]
        public IActionResult SaveMeetingData([FromBody] MeetingViewModel meetingViewModel)
        {
            if (meetingViewModel != null)
            {
                int meetingId = _dataAccessLayer.AddMeetingMinutesMaster(meetingViewModel.MeetingMaster);
                foreach (var detail in meetingViewModel.MeetingDetails)
                {
                    _dataAccessLayer.AddMeetingMinutesDetail(detail, meetingId);
                }

                return Ok(new { message = "Meeting data saved successfully." });
            }

            return BadRequest(new { message = "Invalid data." });
        }
    }
}
