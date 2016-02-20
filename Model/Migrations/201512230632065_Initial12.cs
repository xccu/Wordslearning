namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial12 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Marks", "WordId", "dbo.Words");
            DropForeignKey("dbo.Scores", "UserId", "dbo.Users");
            DropIndex("dbo.Marks", new[] { "WordId" });
            DropIndex("dbo.Scores", new[] { "UserId" });
            AddForeignKey("dbo.Marks", "WordId", "dbo.Words", "WordId", cascadeDelete: true);
            AddForeignKey("dbo.Scores", "UserId", "dbo.Users", "UserId", cascadeDelete: true);
            CreateIndex("dbo.Marks", "WordId");
            CreateIndex("dbo.Scores", "UserId");
        }
        
        public override void Down()
        {
            DropIndex("dbo.Scores", new[] { "UserId" });
            DropIndex("dbo.Marks", new[] { "WordId" });
            DropForeignKey("dbo.Scores", "UserId", "dbo.Users");
            DropForeignKey("dbo.Marks", "WordId", "dbo.Words");
            CreateIndex("dbo.Scores", "UserId");
            CreateIndex("dbo.Marks", "WordId");
            AddForeignKey("dbo.Scores", "UserId", "dbo.Users", "UserId");
            AddForeignKey("dbo.Marks", "WordId", "dbo.Words", "WordId");
        }
    }
}
