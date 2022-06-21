### For one-click start of various range containers


openrasp  https://github.com/baidu/openrasp.git

访问地址  http://127.0.0.1:8080/vulns/
```cmd
docker run -it --rm -e IASTIP="http://IP" -e TOKEN="3d6bb430bc3" -e ProjectName="openrasp" -p 8080:8080 registry.cn-hangzhou.aliyuncs.com/tscuite/bachang:openrasp-v9
```

webgoat  https://github.com/WebGoat/WebGoat.git

访问地址  http://127.0.0.1:8087/WebGoat/
```cmd
docker run -it --rm -e IASTIP="http://IP" -e TOKEN="3d6bb430bc3" -e ProjectName="webgoat" -p 8087:8087 registry.cn-hangzhou.aliyuncs.com/tscuite/bachang:webgoat-v9
```

benchmark  https://github.com/OWASP-Benchmark/BenchmarkJava.git

访问地址  https://127.0.0.1:8443/benchmark/
```cmd
docker run -it --rm -e IASTIP="http://IP" -e TOKEN="3d6bb430bc3" -e ProjectName="benchmark" -p 8443:8443 registry.cn-hangzhou.aliyuncs.com/tscuite/bachang:benchmark-v9
```

iast-jar  https://github.com/spring-projects/spring-boot.git

访问地址  http://127.0.0.1:8085/iast6\?name=hello
```cmd
docker run -it --rm -e IASTIP="http://IP" -e TOKEN="3d6bb430bc3" -e ProjectName="iast-jar" -p 8085:8085 registry.cn-hangzhou.aliyuncs.com/tscuite/bachang:iast-jar-v9
```

iast-grpc-java 内部还有个8888 https://github.com/HXSecurity/dongtai-grpc-range.git

访问地址  http://127.0.0.1:8083/grpc/send?text=1
```cmd
docker run -it --rm -e IASTIP="http://IP" -e TOKEN="3d6bb430bc3" -e ProjectName="iast-grpc-java" -p 8083:8083 registry.cn-hangzhou.aliyuncs.com/tscuite/bachang:iast-grpc-java-v9
```