<html>
<head>
    <title>Twitter TimeLine</title>
    <meta name='layout' content='twitterLayout'/>
</head>

<body>

<g:if test="${flash.message}">
    <h3>${flash.message}</h3>
</g:if>
<g:else>
    <h3>Your Twitter ${timelineName} Timeline</h3>
</g:else>



<h4>Post a tweet</h4>

<g:form controller="springSocialTwitter" action="tweet" name="sendMessage">
    <g:textArea name="message" rows="2" cols="80" />
    <g:submitButton name="submit" value="Send Tweet"/>
</g:form>


<g:form controller="springSocialTwitter" action="search" name="search">
    <g:textField name="query"/><br/>
    <g:submitButton name="submit" value="Search"/>
</g:form>

<ul class="choices">
    <li><g:link controller="springSocialLinkedIn" action="timeline" id="home">Home Timeline</g:link></li>
    <li><g:link controller="springSocialLinkedIn" action="timeline" id="user">User Timeline</g:link></li>
    <li><g:link controller="springSocialLinkedIn" action="timeline" id="public">Public Timeline</g:link></li>
    <li><g:link controller="springSocialLinkedIn" action="timeline" id="mentions">Mentions</g:link></li>
    <li><g:link controller="springSocialLinkedIn" action="timeline" id="favorites">Favorites</g:link></li>
</ul>

<div class="feed">
    <ul class="imagedList">
        <g:each in="${timeline}" var="tweet">
            <li class="imagedItem">
                <div class="image">
                    <g:if test="${tweet.profileImageUrl}">
                        <img src="${tweet.profileImageUrl}" align="left"/>
                    </g:if>
                </div>

                <div class="content">
                    <strong><a href="http://twitter.com/${tweet.fromUser}">${tweet.fromUser}</a></strong><br/>
                    ${tweet.text}<br/>
                    <span class="postTime">${tweet.createdAt}</span>
                </div>
            </li>
        </g:each>

    </ul>
</div>

</body>
</html>
