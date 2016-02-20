namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial11 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Marks", "WordId", "dbo.Words");
            DropIndex("dbo.Marks", new[] { "WordId" });
            AddForeignKey("dbo.Marks", "WordId", "dbo.Words", "WordId");
            CreateIndex("dbo.Marks", "WordId");
        }
        
        public override void Down()
        {
            DropIndex("dbo.Marks", new[] { "WordId" });
            DropForeignKey("dbo.Marks", "WordId", "dbo.Words");
            CreateIndex("dbo.Marks", "WordId");
            AddForeignKey("dbo.Marks", "WordId", "dbo.Words", "WordId", cascadeDelete: true);
        }
    }
}
