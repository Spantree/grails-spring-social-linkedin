/* Copyright 2011 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

def springSocialVersion = "1.0.0.RC1"

grails.project.repos.default = "spantree"

grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
//grails.project.war.file = "target/${appName}-${appVersion}.war"
grails.project.dependency.resolution = {
  // inherit Grails' default dependencies
  inherits("global") {
    // uncomment to disable ehcache
    // excludes 'ehcache'
  }
  log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
  repositories {
    grailsPlugins()
    grailsHome()
    grailsCentral()

    mavenLocal()
    mavenCentral()

    mavenRepo "http://maven.springframework.org/release"
    mavenRepo "http://maven.springframework.org/snapshot"
    mavenRepo "http://maven.springframework.org/milestone"
  }
  dependencies {
    compile("org.springframework.social:spring-social-linkedin:${springSocialVersion}") { transitive = false }
    compile "javax.inject:javax.inject:1"
  }
  plugins {
    compile(":spring-security-core:1.2.4")
    compile(":spring-social-core:0.1.31")
    build(":tomcat:$grailsVersion", ":release:2.2.0", ":rest-client-builder:1.0.3") {
        export = false
    }
  }
}
