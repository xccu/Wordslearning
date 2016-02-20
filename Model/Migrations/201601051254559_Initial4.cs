namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial4 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Configuations",
                c => new
                    {
                        ConfiguationId = c.Int(nullable: false, identity: true),
                        UserId = c.Int(nullable: false),
                        LibraryId = c.Int(nullable: false),
                        StyleNum = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.ConfiguationId)
                .ForeignKey("dbo.Users", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
            DropColumn("dbo.Users", "LibraryId");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Users", "LibraryId", c => c.Int(nullable: false));
            DropIndex("dbo.Configuations", new[] { "UserId" });
            DropForeignKey("dbo.Configuations", "UserId", "dbo.Users");
            DropTable("dbo.Configuations");
        }
    }
}
