#/bin/bash
uri=("001-dir-1.jsp" "002-file-read.jsp" "004-command-1.jsp" "004-command-2.jsp" "005-file-write.jsp" "006-leak-1.jsp" "007-xxe.jsp" "007-xxe-dom4j.jsp" "007-xxe-jdom.jsp" "007-xxe-sax.jsp" "007-xxe-stax.jsp" "008-file-upload.jsp" "009-deserialize.jsp" "010-jstl-import.jsp" "011-ssrf-commons-httpclient.jsp" "011-ssrf-httpclient.jsp" "011-ssrf-urlconnection.jsp" "011-ssrf-okhttp.jsp" "011-ssrf-okhttp3.jsp" "012-jdbc-mysql.jsp" "012-jdbc-mysql8.jsp" "012-jdbc-mysql8-prepared.jsp" "012-jdbc-hsqldb.jsp" "012-mybatis.jsp" "012-hibernate.jsp" "013-multipart-mysql.jsp" "017-xss.jsp" "018-loadlibrary.jsp" "019-file-delete.jsp" "020-random-file.jsp" "021-nio-file.jsp")
vulns=("\"/vulns/010-jstl-import.jsp\"\"服务器端请求伪造\"" "\"/vulns/010-jstl-import.jsp\"\"路径穿越\"" "\"/vulns/001-dir-1.jsp\"\"路径穿越\"" "\"/vulns/002-file-read.jsp\"\"路径穿越\"" "\"/vulns/004-command-1.jsp\"\"命令执行\"" "\"/vulns/004-command-2.jsp\"\"命令执行\"" "\"/vulns/005-file-write.jsp\"\"路径穿越\"" "\"/vulns/006-leak-1.jsp\"" "\"/vulns/007-xxe.jsp\"\"XXE\"" "\"/vulns/007-xxe-dom4j.jsp\"\"XXE\"" "\"/vulns/007-xxe-jdom.jsp\"\"XXE\"" "\"/vulns/007-xxe-sax.jsp\"\"XXE\"" "\"/vulns/007-xxe-stax.jsp\"\"XXE\"" "\"/vulns/008-file-upload.jsp\"" "\"/vulns/009-deserialize.jsp\"\"不安全的反序列化\"" "\"/vulns/011-ssrf-commons-httpclient.jsp\"\"服务器端请求伪造\"" "\"/vulns/011-ssrf-httpclient.jsp\"\"服务器端请求伪造\"" "\"/vulns/011-ssrf-urlconnection.jsp\"\"服务器端请求伪造\"" "\"/vulns/011-ssrf-okhttp.jsp\"\"服务器端请求伪造\"" "\"/vulns/011-ssrf-okhttp3.jsp\"\"服务器端请求伪造\"" "\"/vulns/012-jdbc-mysql.jsp\"\"SQL注入\"" "\"/vulns/012-jdbc-mysql8.jsp\"\"SQL注入\"" "\"/vulns/012-jdbc-mysql8-prepared.jsp\"\"SQL注入\"" "\"/vulns/012-jdbc-hsqldb.jsp\"\"SQL注入\"" "\"/vulns/012-mybatis.jsp\"\"SQL注入\"" "\"/vulns/012-hibernate.jsp\"\"HQL注入\"" "\"/vulns/013-multipart-mysql.jsp\"\"SQL注入\"" "\"/vulns/017-xss.jsp\"\"反射型xss\"" "\"/vulns/018-loadlibrary.jsp\"\"JNI注入\"" "\"/vulns/019-file-delete.jsp\"\"路径穿越\"" "\"/vulns/020-random-file.jsp\"\"路径穿越\"" "\"/vulns/021-nio-file.jsp\"\"路径穿越\"" "\"/vulns/008-file-upload.jsp\"\"路径穿越\"" "\"/vulns/009-deserialize.jsp\"\"弱哈希算法\"" "\"/vulns/011-ssrf-httpclient.jsp\"\"弱随机数算法\"" "\"/vulns/011-ssrf-okhttp.jsp\"\"弱随机数算法\"" "\"/vulns/011-ssrf-okhttp3.jsp\"\"弱随机数算法\"")
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
		echo "----------------------------------------" $name
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
echo "漏报api、漏洞类型"
echo ${ommission[@]}

