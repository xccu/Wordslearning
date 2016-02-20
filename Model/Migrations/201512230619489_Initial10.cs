namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial10 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Scores", "UserId", "dbo.Users");
            DropIndex("dbo.Scores", new[] { "UserId" });
            AddForeignKey("dbo.Scores", "UserId", "dbo.Users", "UserId");
            CreateIndex("dbo.Scores", "UserId");
        }
        
        public override void Down()
        {
            DropIndex("dbo.Scores", new[] { "UserId" });
            DropForeignKey("dbo.Scores", "UserId", "dbo.Users");
            CreateIndex("dbo.Scores", "UserId");
            AddForeignKey("dbo.Scores", "UserId", "dbo.Users", "UserId", cascadeDelete: true);
        }
    }
}
