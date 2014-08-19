dataSource {

    /**
     * Настройки dataSource для H2 Data base
     */
    /*
    pooled = true
    jmxExport = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
    */

    /**
     * Настройки dataSource для PostgreSQL.
     * Требуется добавить в зависимости JDBC драйвер для установленной на стенде
     * версии PostgreSQL в файле
     * BuildConfig.groovy:55
     */
    pooled = true
    driverClassName = "org.postgresql.Driver"
    dialect = "org.hibernate.dialect.PostgreSQL9Dialect"
    username = "postgres"
    password = "123456"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    //singleSession = true // configure OSIV singleSession mode
    //flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    // режим разработки
    development {
        dataSource {
            // При каждом старте hibernate будет делать drop и create для структуры БД
            dbCreate = "create" // one of 'create', 'create-drop', 'update', 'validate', ''
            /**
             * url для H2. БД размещается в памяти.
             */
            //url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
            /**
             * url для PostgreSQL. Необходимо заранее на рабочем стенде настроить сервер БД и
             * создать БД с именем grayscale, доступную по указанному ниже url адресу
             */
            url = "jdbc:postgresql://localhost:5432/grayscale"
        }
    }
    // режим тестирования
    test {
        dataSource {
            // При каждом старте hibernate будет добавлять недостающие элементы схемы БД
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }
    // режим внедрения
    production {
        dataSource {
            /**
             * Настройки dataSource для PostgreSQL в режиме production.
             * Здесь можно указать БД, отличную от той, что была указана в development,
             * однако ее также требуется создать до запуска приложения.
             */

            // При каждом старте hibernate будет добавлять недостающие элементы схемы БД
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:postgresql://localhost:5432/grayscale"

            /**
             * Настройки dataSource для H2 Data base, расположенной в файловой системе.
             * Имя БД prodDb. Файл с индексами и данными будет располагаться в корневом каталоге
             * приложения, либо в корневом каталоге контейнера сервлетов и jsp, это зависит от
             * запуска приложения (из консоли grails или копированием war файла в папку webapps контейнера сервлетов)
             */

            /*
            dbCreate = "update"
            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
            properties {
               // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
               jmxEnabled = true
               initialSize = 5
               maxActive = 50
               minIdle = 5
               maxIdle = 25
               maxWait = 10000
               maxAge = 10 * 60000
               timeBetweenEvictionRunsMillis = 5000
               minEvictableIdleTimeMillis = 60000
               validationQuery = "SELECT 1"
               validationQueryTimeout = 3
               validationInterval = 15000
               testOnBorrow = true
               testWhileIdle = true
               testOnReturn = false
               jdbcInterceptors = "ConnectionState"
               defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
            }
            */
        }
    }
}
