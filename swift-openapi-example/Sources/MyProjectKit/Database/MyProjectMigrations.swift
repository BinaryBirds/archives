import FluentKit

public enum MyProjectMigrations {

    public static var v1: [Migration] {
        [
            TodoSchemaMigration()
        ]
    }
}
