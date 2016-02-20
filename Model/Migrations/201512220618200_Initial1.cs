namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial1 : DbMigration
    {
        public override void Up()
        {
            AddForeignKey("dbo.Marks", "WordId", "dbo.Words", "WordId", cascadeDelete: true);
            CreateIndex("dbo.Marks", "WordId");
        }
        
        public override void Down()
        {
            DropIndex("dbo.Marks", new[] { "WordId" });
            DropForeignKey("dbo.Marks", "WordId", "dbo.Words");
        }
    }
}
