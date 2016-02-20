using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace Model
{
    public class EFcontext : DbContext
    {
        public EFcontext(): base("Test")//inherit the connectionstring from web.config
        {

        }

        public DbSet<Word> Words { get; set; }
        public DbSet<Library> Libraries { get; set; }
        public DbSet<WordLibrary> WordLibraries { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Configuation> Configuations { get; set; }
        public DbSet<Page> Pages { get; set; }
        public DbSet<Score> Scores { get; set; }
        public DbSet<Tested> Testeds { get; set; }
        public DbSet<Mark> Marks { get; set; }
        public DbSet<Music> Musics { get; set; }
        public DbSet<Reading> Readings { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //modelBuilder.Ignore<Word>();
            //modelBuilder.Ignore<Spell>();
            //base.OnModelCreating(modelBuilder);
           // modelBuilder.Entity<Score>().HasRequired(t => t.user).WithOptional(t => t.score);
            modelBuilder.Entity<Score>().HasRequired(t => t.user).WithMany().HasForeignKey(t=>t.UserId);//.WillCascadeOnDelete(false);
            modelBuilder.Entity<Mark>().HasRequired(t => t.word).WithMany().HasForeignKey(t => t.WordId);//.WillCascadeOnDelete(false);

        }
    }
}
