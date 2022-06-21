#/bin/bash
uri=("/WebGoat/SqlInjection/attack2" "/WebGoat/SqlInjection/attack3" "/WebGoat/SqlInjection/attack4" "/WebGoat/SqlInjection/attack5" "/WebGoat/SqlInjection/assignment5a" "/WebGoat/SqlInjection/assignment5b" "/WebGoat/SqlInjection/attack8" "/WebGoat/SqlInjection/attack9" "/WebGoat/SqlInjection/attack10" "/WebGoat/SqlInjectionAdvanced/attack6a" "/WebGoat/SqlInjectionAdvanced/attack6b" "/WebGoat/SqlInjectionAdvanced/challenge" "/WebGoat/SqlInjectionAdvanced/challenge_Login" "/WebGoat/SqlInjectionAdvanced/quiz" "/WebGoat/SqlInjectionAdvanced/quiz" "/WebGoat/SqlInjectionMitigations/servers" "/WebGoat/SqlInjectionMitigations/attack10a" "/WebGoat/SqlInjectionMitigations/attack10b" "/WebGoat/SqlOnlyInputValidation/attack" "/WebGoat/SqlOnlyInputValidationOnKeywords/attack" "/WebGoat/SqlInjectionMitigations/attack12a" "/WebGoat/PathTraversal/profile-upload" "/WebGoat/PathTraversal/profile-picture" "/WebGoat/PathTraversal/profile-upload-fix" "/WebGoat/PathTraversal/profile-picture" "/WebGoat/PathTraversal/profile-upload-remove-user-input" "/WebGoat/PathTraversal/profile-picture" "/WebGoat/PathTraversal/random" "/WebGoat/PathTraversal/zip-slip" "/WebGoat/auth-bypass/verify-account" "/WebGoat/JWT/decode" "/WebGoat/JWT/quiz" "/WebGoat/JWT/secret" "/WebGoat/JWT/refresh/checkout" "/WebGoat/PasswordReset/simple-mail" "/WebGoat/PasswordReset/questions" "/WebGoat/PasswordReset/SecurityQuestions" "/WebGoat/PasswordReset/reset/login" "/WebGoat/SecurePasswords/assignment" "/WebGoat/InsecureLogin/task" "/WebGoat/xxe/simple" "/WebGoat/xxe/comments" "/WebGoat/xxe/content-type" "/WebGoat/xxe/comments" "/WebGoat/xxe/blind" "/WebGoat/xxe/comments" "/WebGoat/IDOR/login" "/WebGoat/IDOR/profile" "/WebGoat/IDOR/diff-attributes" "/WebGoat/IDOR/profile/alt-path" "/WebGoat/access-control/hidden-menu" "/WebGoat/access-control/user-hash" "/WebGoat/CrossSiteScripting/attack1" "/WebGoat/CrossSiteScripting/attack5a" "/WebGoat/CrossSiteScripting/attack6a" "/WebGoat/CrossSiteScripting/dom-follow-up" "/WebGoat/CrossSiteScripting/quiz" "/WebGoat/InsecureDeserialization/task" "/WebGoat/csrf/confirm-flag-1" "/WebGoat/csrf/feedback/message" "/WebGoat/csrf/login" "/WebGoat/SSRF/task1" "/WebGoat/SSRF/task2" "/WebGoat/BypassRestrictions/FieldRestrictions" "/WebGoat/BypassRestrictions/frontendValidation" "/WebGoat/clientSideFiltering/attack1" "/WebGoat/clientSideFiltering/challenge-store/coupons/get_it_for_free" "/WebGoat/clientSideFiltering/getItForFree" "/WebGoat/HtmlTampering/task" "/WebGoat/challenge/1" "/WebGoat/challenge/5"
)
vulns=("\"/WebGoat/PathTraversal/profile-upload-fix\"\"路径穿越\"" "\"/WebGoat/PathTraversal/profile-upload\"\"路径穿越\"" "\"/WebGoat/PathTraversal/profile-upload-fix\"\"路径穿越\"" "\"/WebGoat/SqlInjection/attack2\"\"SQL注入\"" "\"/WebGoat/SqlInjection/attack3\"\"SQL注入\"" "\"/WebGoat/SqlInjection/attack4\"\"SQL注入\"" "\"/WebGoat/SqlInjection/attack5\"\"SQL注入\"" "\"/WebGoat/SqlInjection/attack2\"\"SQL注入\"" "\"/WebGoat/SqlInjection/attack3\"\"SQL注入\"" "\"/WebGoat/SqlInjection/attack4\"\"SQL注入\"" "\"/WebGoat/SqlInjection/attack5\"\"SQL注入\"" "\"/WebGoat/SqlInjection/assignment5a\"\"SQL注入\"" "\"/WebGoat/SqlInjection/assignment5b\"\"SQL注入\"" "\"/WebGoat/SqlInjection/attack8\"\"SQL注入\"" "\"/WebGoat/SqlInjection/attack9\"\"SQL注入\"" "\"/WebGoat/SqlInjection/attack10\"\"SQL注入\"" "\"/WebGoat/SqlInjectionAdvanced/attack6a\"\"SQL注入\"" "\"/WebGoat/SqlInjectionAdvanced/challenge\"\"SQL注入\"" "\"/WebGoat/SqlInjectionMitigations/servers\"\"SQL注入\"" "\"/WebGoat/SqlOnlyInputValidation/attack\"\"SQL注入\"" "\"/WebGoat/SqlOnlyInputValidationOnKeywords/attack\"\"SQL注入\"" "\"/WebGoat/xxe/simple\"\"XXE\"" "\"/WebGoat/xxe/blind\"\"XXE\"" "\"/WebGoat/PathTraversal/profile-upload-remove-user-input\"\"路径穿越\"" "\"/WebGoat/PathTraversal/profile-upload-remove-user-input\"\"路径穿越\"" "\"/WebGoat/PathTraversal/zip-slip\"\"路径穿越\"")
data=""
iastvulns=()
novulnapi=()
ommission=()
dataif=""
PROJECTID=""
IASTIP=$2
TOKEN=$3
PROJECTNAME=$1
function getprojectname(){
	projectdata=$(curl -XGET -H "Authorization: Token $TOKEN" "$IASTIP/api/v1/projects?page=1&pageSize=20&name=")
	for a in {0..20}
	do
		name=$(echo ${projectdata} | jq '.data['${a}'].name')
		if [[ "$name" =~ "$PROJECTNAME" ]]
		then
			PROJECTID=$(echo ${projectdata=} | jq '.data['${a}'].id')
			echo $PROJECTID
			return
		fi
	done

}
function fun(){
	for item in {1..4}
	do
		data=$(curl -XGET -H 'Authorization: Token '$TOKEN $IASTIP'/api/v1/vulns?url='$1'&level='$item'&project_id='$PROJECTID)
		dataif=$(echo ${data} | jq '.data[]')
		if [ -z "$dataif" ];
		then
			continue
		else
			break
		fi
	done
}
function func(){
	num=$(echo ${data} | jq '.page.alltotal')

	num=`expr $num - 1`
	for a in `eval echo {0..$num}`
	do
		types=$(echo ${data} | jq '.data['${a}'].type')
		uri=$(echo ${data} | jq '.data['${a}'].uri')
		uritype=$uri$types
		if [[ "${vulns[@]}" =~ "$uritype" ]]
		then
			iastvulns+=("${uritype}")
			u=0
		else
			ommission+=("${uritype}")
			u=0
		fi
	done
}
getprojectname
for items in ${uri[@]}
do
	
        fun $items
	if [ -z "$dataif" ];
	then
		novulnapi+=($items)
		continue
	fi
	func
done
echo "未检测出的漏洞："
echo ${vulns[@]} ${iastvulns[@]} | tr ' ' '\n' | sort | uniq -u
echo "无漏洞api"
echo ${novulnapi[@]}
echo "提示信息："
echo ${ommission[@]}

