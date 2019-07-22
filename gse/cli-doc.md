# GSE-CLI 

**gsecli作为客户端模块，主要实现对gsenetwork三个接口的远程调用：**  
* transfer   
* tobeproducer   
* vote

**客户端启动后会有命令行输入提示**
```
Enter Command:
> 
```
**命令行格式：**
```
command [[-parameter] value]
```
| 命令 | 缩写 | 参数 | 功能 |
|:---:|:-----:| :----:| :----:|
| help | ? | 无 | 打印帮助信息 |
| quit | q | 无 | 退出 |
| login | 无 | 无 | 登录 |
| log out | 无 | 无 | 登出 |
| host | h | ip地址 | 修改ip |
| port | p | 端口号 | 修改端口号 | 
| getblock | 无 | 块号 | 获取对应块信息 |
| getversion | 无 | 无 | 获取版本信息 |
| transfer | 无 | recipient (-r) value (-v) | 转账 |
| tobeproducer | 无 | 无 | 成为产块节点 |
| vote | 无 | candidate (-c) ballot (-b) | 投票|
 
 **以上命令分为三类:**   
 * 无参命令：help, quit, login, log out, getversion, tobeproducer  
 * 单一参数命令：host, port, getblock  
 * 多参数命令：transfer, vote
 
 ###参数说明：
 * 单一参数：
    * host： 有效的ip地址，默认 127.0.0.1
    * port： 有效的端口号，默认 50505
    * getblock： 有效的块号，以10进制表示
 * 多参数：
    * transfer：
        * recipient：接受者的地址
        * value： 转账金额
    * vote：
        * candidate：候选人地址
        * ballot： 投票数
 
*注：*  
1. transfer, tobeproducer, vote需要首先进行登录  
2. candidate和ballot支持重复输入，即同时对多人进行投票：  
```
vote -c <value> -b <value> -c <value -b <value> ...
```
 ###使用样例：
 *打印帮助信息：*
 ```aidl
Enter Command:
> help
Basic Command Line Parameter App
Options:
  -? [ --help ]          Print help messages
  -q [ --quit ]          quit
  --getblock arg         get a block by number
  --getversion           get version
  --transfer             transfer accounts
  --tobeproducer         to be a producer
  --vote                 vote
  --login                login
  --logout               log out
  -h [ --host ] arg      host ip
  -p [ --port ] arg      port number
  -r [ --recipient ] arg recipient
  -v [ --value ] arg     transfer amount
  -c [ --candidate ] arg candidates
  -b [ --ballot ] arg    ballot
```
*退出：*
```aidl
Enter Command:
> quit
program is starting exit
```
*获取版本信息：*
```aidl
Enter Command:
> getversion
{
   "version" : "version 1.0"
}
```
*获取块信息：*
```aidl
Enter Command:
> getblock 10
{
   "ChainID" : "0x0",
   "blockNumber" : "0xffffffffffffffff",
   "extra" : "0x",
   "hash" : "0x37232d4ddb33ef973bc3bab260afb0fb9c76bb376fda963f9c3ec2cf3eefc3cf",
   "merkle" : "0x0000000000000000000000000000000000000000000000000000000000000000",
   "parentHash" : "0x0000000000000000000000000000000000000000000000000000000000000000",
   "producer" : "0x0000000000000000000000000000000000000000",
   "receiptHash" : "0x0000000000000000000000000000000000000000000000000000000000000000",
   "signature" : "0x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
   "timestamp" : "0x7f92c67021c0",
   "txHash" : "0x0000000000000000000000000000000000000000000000000000000000000000"
}
```
*登录：*
```aidl
Enter Command:
> login
```
*登出：*
```aidl
Enter Command:
> logout
```
*转账：*
```aidl
Enter Command:
> transfer -r 0x0552eBEA249d759423608Cd41d200B2d8F99e78d -v 10
[2018-10-30 15:10:00.436655] [0x00007fff9b0b7380] [info]    please login first
Enter Command:
> login
Enter Command:
> transfer -r 0x0552eBEA249d759423608Cd41d200B2d8F99e78d -v 10
[2018-10-30 15:10:08.855956] [0x00007fff9b0b7380] [info]    Transaction sing sucess!
[2018-10-30 15:10:08.856236] [0x00007fff9b0b7380] [info]    Client::broadcast

{
   "ChainID" : "0x0",
   "data" : "",
   "hash" : "0x709dde216bba1c353434384de0fdf3d431a10ec8555150c04969570922c4df2b",
   "recipient" : "0x0552ebea249d759423608cd41d200b2d8f99e78d",
   "sender" : "0x8e5ca2eead12d57b1e97beb7dcffaedd07effb17",
   "signature" : "0x0b91c8c2d2ee2f0221fc2c5c390455f3157c02d25e09b83d0c34e34aed4ae422077d3aa98d3c5ab74cdb5f8b97a4fc1f61b7ab9e7c1c5341b4a3ae5ae595cd8b01",
   "type" : "0x1",
   "value" : "0xa"
}
```
*投票：*
```aidl
Enter Command:
> vote -c 0x0552eBEA249d759423608Cd41d200B2d8F99e78d -b 1
[2018-10-30 15:12:49.757022] [0x00007fff9b0b7380] [info]    Transaction sing sucess!
[2018-10-30 15:12:49.757646] [0x00007fff9b0b7380] [info]    Client::broadcast

{
   "ChainID" : "0x0",
   "data" : "0x30783330373836343338333933373634333633393334333033353335333236353632363536313332333433393634333733353339333433323333333633303338363336343334333136343332333033303632333236343338363633393339363533373338363433303331",
   "hash" : "0x8ac97212bc2bdadabbce7708a06cedf78e1497e99dad6fb44b9e1a0bedc6d399",
   "recipient" : "0x0000000000000000000000000000000000000000",
   "sender" : "0x8e5ca2eead12d57b1e97beb7dcffaedd07effb17",
   "signature" : "0xed0d3e7d84f1fc7c3ec39a5794e6a5534e21d16bc4e9f8dfdf7011090c782a93354669610ae06c3adae2586681dfab357224cef758ff165984b5a5026bf0e4ff01",
   "type" : "0x0",
   "value" : "0x0"
}

```
*成为产块节点：*
```aidl
Enter Command:
> tobeproducer
[2018-10-30 15:13:28.439197] [0x00007fff9b0b7380] [info]    Transaction sing sucess!
[2018-10-30 15:13:28.439436] [0x00007fff9b0b7380] [info]    Client::broadcast

{
   "ChainID" : "0x0",
   "data" : "",
   "hash" : "0x4e404e0349d0f4a265606b232eaaa4094c482636e903e14f2321771fbedad445",
   "recipient" : "0x0000000000000000000000000000000000000000",
   "sender" : "0x8e5ca2eead12d57b1e97beb7dcffaedd07effb17",
   "signature" : "0x4ba2c5bb84ed3a1fd039bfa6491e30a9b6eda8b46a1f08fbe8d28989110ab647174fbdeacff4bb9fecd02abc83fd4ca957dea0199cc60b79769513cce3c4ab8600",
   "type" : "0x0",
   "value" : "0x0"
}

```