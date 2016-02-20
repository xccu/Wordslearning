namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial7 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Scores", "UserId", "dbo.Users");
            DropIndex("dbo.Scores", new[] { "UserId" });
            AlterColumn("dbo.Scores", "ScoreId", c => c.Int(nullable: false));
            DropPrimaryKey("dbo.Scores", new[] { "ScoreId" });
            AddPrimaryKey("dbo.Scores", "UserId");
            AddForeignKey("dbo.Scores", "UserId", "dbo.Users", "UserId");
            CreateIndex("dbo.Scores", "UserId");
        }
        
        public override void Down()
        {
            DropIndex("dbo.Scores", new[] { "UserId" });
            DropForeignKey("dbo.Scores", "UserId", "dbo.Users");
            DropPrimaryKey("dbo.Scores", new[] { "UserId" });
            AddPrimaryKey("dbo.Scores", "ScoreId");
            AlterColumn("dbo.Scores", "ScoreId", c => c.Int(nullable: false, identity: true));
            CreateIndex("dbo.Scores", "UserId");
            AddForeignKey("dbo.Scores", "UserId", "dbo.Users", "UserId", cascadeDelete: true);
        }
    }
}
