class Bad {
    @Bean
    @ConditionalOnMissingBean
    public SessionFactory<FTPFile> bad1(FtpSessionFactoryProperties properties) {
        // ruleid: spring-ftp-request
        DefaultFtpSessionFactory ftpSessionFactory = new DefaultFtpSessionFactory();
        ftpSessionFactory.setHost("ftp://example.com");
        ftpSessionFactory.setPort(properties.getPort());
        ftpSessionFactory.setUsername(properties.getUsername());
        ftpSessionFactory.setPassword(properties.getPassword());
        ftpSessionFactory.setClientMode(properties.getClientMode().getMode());
        if (properties.getCacheSessions() != null) {
            CachingSessionFactory<FTPFile> csf = new CachingSessionFactory<>(ftpSessionFactory);
            return csf;
        }
        else {
            return ftpSessionFactory;
        }
    }

    @Bean
    @ConditionalOnMissingBean
    public SessionFactory<FTPFile> bad2(FtpSessionFactoryProperties properties) {
        // ruleid: spring-ftp-request
        DefaultFtpSessionFactory ftpSessionFactory = new DefaultFtpSessionFactory();
        String url = "ftp://example.com";
        ftpSessionFactory.setHost(url);
        ftpSessionFactory.setPort(properties.getPort());
        ftpSessionFactory.setUsername(properties.getUsername());
        ftpSessionFactory.setPassword(properties.getPassword());
        ftpSessionFactory.setClientMode(properties.getClientMode().getMode());
        if (properties.getCacheSessions() != null) {
            CachingSessionFactory<FTPFile> csf = new CachingSessionFactory<>(ftpSessionFactory);
            return csf;
        }
        else {
            return ftpSessionFactory;
        }
    }
}

class Ok {
    @Bean
    @ConditionalOnMissingBean
    public SessionFactory<FTPFile> ok1(FtpSessionFactoryProperties properties) {
        // ok: spring-ftp-request
        DefaultFtpSessionFactory ftpSessionFactory = new DefaultFtpSessionFactory();
        ftpSessionFactory.setHost("sftp://example.com");
        ftpSessionFactory.setPort(properties.getPort());
        ftpSessionFactory.setUsername(properties.getUsername());
        ftpSessionFactory.setPassword(properties.getPassword());
        ftpSessionFactory.setClientMode(properties.getClientMode().getMode());
        if (properties.getCacheSessions() != null) {
            CachingSessionFactory<FTPFile> csf = new CachingSessionFactory<>(ftpSessionFactory);
            return csf;
        }
        else {
            return ftpSessionFactory;
        }
    }

    @Bean
    @ConditionalOnMissingBean
    public SessionFactory<FTPFile> ok2(FtpSessionFactoryProperties properties) {
        // ok: spring-ftp-request
        DefaultFtpSessionFactory ftpSessionFactory = new DefaultFtpSessionFactory();
        String url = "sftp://example.com";
        ftpSessionFactory.setHost(url);
        ftpSessionFactory.setPort(properties.getPort());
        ftpSessionFactory.setUsername(properties.getUsername());
        ftpSessionFactory.setPassword(properties.getPassword());
        ftpSessionFactory.setClientMode(properties.getClientMode().getMode());
        if (properties.getCacheSessions() != null) {
            CachingSessionFactory<FTPFile> csf = new CachingSessionFactory<>(ftpSessionFactory);
            return csf;
        }
        else {
            return ftpSessionFactory;
        }
    }
}
