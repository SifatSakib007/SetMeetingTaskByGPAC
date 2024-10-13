using System.Data;
using System.Data.SqlClient;

namespace SetMeetingTask.Models
{
    public class DataAccessLayer
    {
        private readonly IConfiguration _configuration;
        private readonly string connectionString;

        public DataAccessLayer(IConfiguration configuration)
        {
            configuration = configuration;
            connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public int AddMeetingMinutesMaster(MeetingMinutesMaster meetingMinutesMaster)
        {
            int newMeetingId;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("Meeting_Minutes_Master_Save_SP", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                // Add parameters
                cmd.Parameters.AddWithValue("@CustomerName", meetingMinutesMaster.CustomerName);
                cmd.Parameters.AddWithValue("@MeetingDate", meetingMinutesMaster.MeetingDate);
                cmd.Parameters.AddWithValue("@MeetingPlace", meetingMinutesMaster.MeetingPlace);
                cmd.Parameters.AddWithValue("@AttendsClient", meetingMinutesMaster.AttendsClient);
                cmd.Parameters.AddWithValue("@AttendsHost", meetingMinutesMaster.AttendsHost);
                cmd.Parameters.AddWithValue("@Agenda", meetingMinutesMaster.Agenda);
                cmd.Parameters.AddWithValue("@Discussion", meetingMinutesMaster.Discussion);
                cmd.Parameters.AddWithValue("@Decision", meetingMinutesMaster.Decision);

                connection.Open();

                // Execute the stored procedure and get the new MeetingId using ExecuteScalar()
                newMeetingId = Convert.ToInt32(cmd.ExecuteScalar());

                connection.Close();
            }

            return newMeetingId; // Return the new MeetingId
        }


        public void AddMeetingMinutesDetail(MeetingMinutesDetail meetingMinutesDetail, int meetingId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("Meeting_Minutes_Details_Save_SP", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@MeetingId", meetingId);
                cmd.Parameters.AddWithValue("@ProductName", meetingMinutesDetail.ProductName);
                cmd.Parameters.AddWithValue("@Quantity", meetingMinutesDetail.Quantity);
                cmd.Parameters.AddWithValue("@Unit", meetingMinutesDetail.Unit);

                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
            }
        }

        public IEnumerable<MeetingMinutesDetail> AllMeetingMinutesDetail()
        {
            List<MeetingMinutesDetail> meetingMinutesDetails = new List<MeetingMinutesDetail>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("View_Meeting_Minutes_Details_Save_SP", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    MeetingMinutesDetail meetingMinutesDetail = new MeetingMinutesDetail();
                    meetingMinutesDetail.DetailId = Convert.ToInt32(reader["DetailId"]);
                    meetingMinutesDetail.ProductName = reader["ProductName"].ToString();
                    meetingMinutesDetail.Quantity = Convert.ToInt32(reader["Quantity"]);
                    meetingMinutesDetail.Unit = reader["Unit"].ToString();

                    meetingMinutesDetails.Add(meetingMinutesDetail);
                }
                connection.Close();
            }
            return meetingMinutesDetails;
        }

        public void UpdateMeetingMinutesDetail(MeetingMinutesDetail meetingMinutesDetail)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("Meeting_Minutes_Detail_Update_SP", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@DetailId", meetingMinutesDetail.DetailId);
                cmd.Parameters.AddWithValue("@ProductName", meetingMinutesDetail.ProductName);
                cmd.Parameters.AddWithValue("@Quantity", meetingMinutesDetail.Quantity);
                cmd.Parameters.AddWithValue("@Unit", meetingMinutesDetail.Unit);

                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
            }
        }

        public void DeleteMeetingMinutesDetail(int detailId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("Meeting_Minutes_Detail_Delete_SP", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@DetailId", detailId);

                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
            }
        }
    }
}
