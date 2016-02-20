namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial1 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.WordLibraries", "WordId", "dbo.Words");
            DropForeignKey("dbo.WordLibraries", "LibraryId", "dbo.Libraries");
            DropIndex("dbo.WordLibraries", new[] { "WordId" });
            DropIndex("dbo.WordLibraries", new[] { "LibraryId" });
            DropTable("dbo.WordLibraries");
            DropTable("dbo.Libraries");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.Libraries",
                c => new
                    {
                        LibraryId = c.Int(nullable: false, identity: true),
                        LibraryName = c.String(),
                    })
                .PrimaryKey(t => t.LibraryId);
            
            CreateTable(
                "dbo.WordLibraries",
                c => new
                    {
                        WordLibraryId = c.Int(nullable: false, identity: true),
                        LibraryId = c.Int(nullable: false),
                        WordId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.WordLibraryId);
            
            CreateIndex("dbo.WordLibraries", "LibraryId");
            CreateIndex("dbo.WordLibraries", "WordId");
            AddForeignKey("dbo.WordLibraries", "LibraryId", "dbo.Libraries", "LibraryId", cascadeDelete: true);
            AddForeignKey("dbo.WordLibraries", "WordId", "dbo.Words", "WordId", cascadeDelete: true);
        }
    }
}
