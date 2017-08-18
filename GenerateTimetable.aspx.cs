using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Timetable_app.Models;

namespace Timetable_app
{
    public partial class GenerateTimetable : System.Web.UI.Page
    {
        public List<TimetableDB> subjectList = new List<TimetableDB>();
        protected void Page_Load(object sender, EventArgs e)
        {
            TimetableDBContext context = new TimetableDBContext();
            
            subjectList = context.TimetableDB.ToList();
            
            
        }

        

        protected async void Generate_Click(object sender, EventArgs e)
        {
            try
            {
                TimetableDBContext context = new TimetableDBContext();
                //recreate the GenTimetable DB to delete all old entries
                context.GenTimetable.Create();
                //initialize a list of all subject
                List<TimetableDB> orderSubjects = context.TimetableDB.OrderByDescending(m => m.TPW).Where(m => m.TPW != 0).ToList();
                List<string> daysOfWeek = new List<string>();
                daysOfWeek.Add("Monday");
                daysOfWeek.Add("Tuesday");
                daysOfWeek.Add("Wednesday");
                daysOfWeek.Add("Thursday");
                daysOfWeek.Add("Friday");
                int l = 1;
                //initialise the starting time to 8AM in the morning outside the foreach loop so that the time is not set to 8AM each time a subject is added
                int j = 8;
                int i = 0;

                //we are assuming the day ends by 4PM using the 24HRs clock for easier calculation
                try
                {
                    //create time table as long as there are subjects remaining and the number of times per week is not 0 for the any of the subjects
                    while (orderSubjects.Count != 0)
                    { 
                     orderSubjects = context.TimetableDB.OrderByDescending(m => m.TPW).Where(m => m.TPW != 0).ToList();
                    foreach (var subject in orderSubjects)
                    {
                            context.GenTimetable.Add(new GenTimetable { Subject = subject.Subject, Teacher = subject.Teacher, Venue = subject.Venue, Days = daysOfWeek[i], Start_Time = j.ToString(), End_Time = (j + subject.Duration_HR).ToString() });
                            j = j + subject.Duration_HR;
                            await context.SaveChangesAsync();
                            var updateSubject = context.TimetableDB.Where(m => m.ID == subject.ID).FirstOrDefault();
                            updateSubject.TPW--;
                            await context.SaveChangesAsync();
                            l++;
    
                            if (j >= 20)
                            {
                                j = 8;
                                i++;
                            }
                    }
                    }
                    val_txt.InnerText = "Timetable has been successfully generated, click on View Timetable to view the generated timetable.";

                }
                catch (Exception exp)
                {
                    val_txt.InnerText = "The total number of hours for the subjects is greater than the maximum hours that can be taken in a week. Consider reducing the number of hours per subject, reducing the number of times per week for a subject or the number of subjects";
                    
                } 
                

            }
            catch (Exception exp)
            {

                val_txt.InnerText = "Timetable generation failed! Edit the details and try again. The thrown exception is <br/>" + exp.Message;
            }

        }


    }
}