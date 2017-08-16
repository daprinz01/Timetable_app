using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Timetable_app.Models;

namespace Timetable_app
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected async void Add_Subject(object sender, EventArgs e)
        {
            Random rand = new Random();
            try
            {
                TimetableDBContext context = new TimetableDBContext();
                context.TimetableDB.Add(new TimetableDB { Teacher = Teacher.Value, Subject = Subject.Value, Venue = Venue.Value, TPW = int.Parse(Times.Value), Duration_HR = int.Parse(Start_Hour.Value)});
                await context.SaveChangesAsync();
                validation_msg.InnerText = "Subject added successfully! Add another subject.";
            }
            catch (Exception exp)
            {
                validation_msg.InnerText = "Subject addition failed! Enter correct values and format and try again." + "\nThe error message is " + exp;
            }

        }
    }
}