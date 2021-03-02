using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GnTAMRDashboard.UtilityManager
{
    public class UtilityManager
    {
        public List<string> GetTimeIntervals()
        {
            List<string> timeIntervals = new List<string>();
            TimeSpan startTime = new TimeSpan(0, 0, 0);
            DateTime startDate = new DateTime(DateTime.MinValue.Ticks); // Date to be used to get shortTime format.
            for (int i = 0; i < 48; i++)
            {
                int minutesToBeAdded = 30 * i;      // Increasing minutes by 30 minutes interval
                TimeSpan timeToBeAdded = new TimeSpan(0, minutesToBeAdded, 0);
                TimeSpan t = startTime.Add(timeToBeAdded);
                DateTime result = startDate + t;
                timeIntervals.Add(result.ToShortTimeString());      // Use Date.ToShortTimeString() method to get the desired format                
            }
            return timeIntervals;
        }


        //public void BindTime()
        //{
        //    // Set the start time (00:00 means 12:00 AM)
        //    DateTime StartTime = DateTime.ParseExact("00:00", "HH:mm", null);
        //    // Set the end time (23:55 means 11:55 PM)
        //    DateTime EndTime = DateTime.ParseExact("23:55", "HH:mm", null);
        //    //Set 5 minutes interval
        //    TimeSpan Interval = new TimeSpan(0, 5, 0);
        //    //To set 1 hour interval
        //    //TimeSpan Interval = new TimeSpan(1, 0, 0);           
        //    ddlTimeFrom.Items.Clear();
        //    ddlTimeTo.Items.Clear();
        //    while (StartTime <= EndTime)
        //    {
        //        ddlTimeFrom.Items.Add(StartTime.ToShortTimeString());
        //        ddlTimeTo.Items.Add(StartTime.ToShortTimeString());
        //        StartTime = StartTime.Add(Interval);
        //    }
        //    ddlTimeFrom.Items.Insert(0, new ListItem("--Select--", "0"));
        //    ddlTimeTo.Items.Insert(0, new ListItem("--Select--", "0"));
        //}


    }
}