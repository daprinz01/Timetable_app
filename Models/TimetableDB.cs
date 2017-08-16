using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Data.Entity;

namespace Timetable_app.Models
{
    //Table to store timetable settings
    public class TimetableDB
    {
        [Key]
        public long ID { get; set; }
        public string Teacher { get; set; }
        public string Subject { get; set; }
        public string Venue { get; set; }
        public int Duration_HR { get; set; }
        public int TPW { get; set; }
      //  public long GenKey { get; set; }
       // public virtual GenTimetable GenTimetable { get; set; }
    }
    //Table to store the generated timetable
    public class GenTimetable {
        //constructor to initialize this table
      /*  public GenTimetable()
        {
            this.TimetableDB = new ObservableCollection<TimetableDB>();
        }*/
        [Key]
        public long GenKey { get; set; }
        public string Teacher { get; set; }
        public string Subject { get; set; }
        public string Venue { get; set; }
        public string Start_Time { get; set; }
        public string End_Time { get; set; }
        public string Days { get; set; }
       // public virtual ObservableCollection<TimetableDB> TimetableDB { get; private set; }
    }

    //This class creates the DBContext for the database
    public class TimetableDBContext : DbContext
    {
        public TimetableDBContext() : base("TimetableDBConnectionString")
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<TimetableDBContext, Timetable_app.Migrations.Configuration>("TimetableDBConnectionString"));
        }
        public DbSet<GenTimetable> GenTimetable { get; set; }
        public DbSet<TimetableDB> TimetableDB { get; set; }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {

            base.OnModelCreating(modelBuilder);
        }
    }
    public class UserDBInitializer : CreateDatabaseIfNotExists<TimetableDBContext>
    {
        protected override void Seed(TimetableDBContext context)
        {
            base.Seed(context);
        }
    }
}