namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial8 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Scores", "UserId", "dbo.Users");
            DropIndex("dbo.Scores", new[] { "UserId" });
            AlterColumn("dbo.Scores", "ScoreId", c => c.Int(nullable: false, identity: true));
            DropPrimaryKey("dbo.Scores", new[] { "UserId" });
            AddPrimaryKey("dbo.Scores", "ScoreId");
            AddForeignKey("dbo.Scores", "UserId", "dbo.Users", "UserId", cascadeDelete: true);
            CreateIndex("dbo.Scores", "UserId");
        }
        
        public override void Down()
        {
            DropIndex("dbo.Scores", new[] { "UserId" });
            DropForeignKey("dbo.Scores", "UserId", "dbo.Users");
            DropPrimaryKey("dbo.Scores", new[] { "ScoreId" });
            AddPrimaryKey("dbo.Scores", "UserId");
            AlterColumn("dbo.Scores", "ScoreId", c => c.Int(nullable: false));
            CreateIndex("dbo.Scores", "UserId");
            AddForeignKey("dbo.Scores", "UserId", "dbo.Users", "UserId");
        }
    }
}
