import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
	// uncomment to serve files from /Public folder
	// app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

	/*
	CREATE USER docker;
	CREATE DATABASE docker;
	GRANT ALL PRIVILEGES ON DATABASE docker TO docker;
	ALTER USER user_name WITH PASSWORD 'password';
	*/
	guard let pgUrl = Environment.get("DATABASE_URL") else {
		fatalError("DATABASE_URL not defined")
	}
	try app.databases.use(.postgres(url: pgUrl), as: .psql)

	/*
	app.databases.use(.postgres(
		hostname: Environment.get("DATABASE_HOST") ?? "localhost",
		username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
		password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
		database: Environment.get("DATABASE_NAME") ?? "vapor_database"
	), as: .psql)
	*/

	/*
	app.logger.logLevel = .debug
	try app.autoMigrate().wait()
	*/

	// register routes
	try routes(app)
}
