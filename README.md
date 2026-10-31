# MCGS MCP 0.1.0 实验版交付包

交付日期：2026-10-31。面向 Windows 上 MCGS 嵌入版7.7的本地 stdio MCP 服务，包含源码、依赖清单、安装启动脚本、配置模板及测试。

**当前定位：工程检查、备份、导出脚本文本处理、按映射进行 Modbus 通信，以及针对已测格式的有限控件副本修改。它还不是通用的组态画面编辑器。**

请先看 [功能说明](docs/功能说明.md)，再看 [安装与使用](docs/安装与使用.md)。全部23个工具列在 [接口清单](docs/接口清单.md)；实测边界见 [实测结果与限制](docs/实测结果与限制.md)。

## 快速安装

本机验证环境：Windows、Python3.14.4。建议使用同版本64位Python。项目声明Python≥3.11，但其他版本未实际验证。

1. 完整解压到固定目录，例如 C:\MCGS-MCP；不要直接在ZIP里运行。
2. 在解压目录打开PowerShell，执行 `.\setup.ps1`，安装时需要联网下载Python依赖。
3. 复制 `config.example.json` 为 `config.local.json`，按说明填写安装目录、工程和脚本别名。
4. 执行 `.\generate-client-config.ps1`，把生成的 `mcp-client.local.json` 合并到支持该结构的MCP客户端配置中。
5. 客户端启动服务器后，先调用 `mcgs_get_capabilities` 和 `mcgs_detect_environment`。

默认模板没有绑定工程或通信地址，文件副本写入、Modbus写入、界面桥接均关闭。启用某项功能前需完成其配置。直接启动：

```powershell
.\start-server.ps1 -Config .\config.local.json
```

这是标准输入/输出协议服务，手工启动后等待输入通常没有界面，也没有网页端口。一般由MCP客户端管理进程。

## 包内内容

- `src/`：完整服务源码。
- `tests/`：测试和少量测得的控件记录片段，不含完整工程。
- `docs/`：中文安装、功能、接口和实测说明。
- `examples/`、`config.demo.json`、`scripts/smoke_test.py`：隔离测试示例。
- 安装、启动、生成客户端配置的PowerShell脚本及锁定依赖。
- `MANIFEST-SHA256.json`：包内文件校验清单。

包内不包含MCGS软件、授权、Python解释器、虚拟环境、离线依赖轮子、用户工程、工程备份、真实本机配置、运行日志或截图。这是需要安装依赖的源码交付包，不是免安装EXE。
