# Windows 使用说明

所有命令从工具包根目录执行。源码下载不会自动安装依赖或登录账号；下面按需要选择组件。

## 图文技能

```powershell
# 预览目标，然后执行复制；请将目录改为实际项目路径。
.\scripts\Install-Skills.ps1 -Destination 'D:\Projects\my-project\.agents\skills' -WhatIf
.\scripts\Install-Skills.ps1 -Destination 'D:\Projects\my-project\.agents\skills'
```

该目录适合项目级技能使用。也可以把 Destination 指向宿主已经使用的技能目录。复制后重新加载技能或打开新会话。目标已存在时脚本停止，不覆盖你的修改。

- `baoyu-xhs-images`：先分析内容、确定分镜，再调用宿主图片生成能力。Codex 有原生图片生成工具时可用它；没有图片后端时只复制技能不会获得出图能力。本包没有带入可选的 baoyu-image-gen 或其他无关技能。
- `guizang-social-card-skill`：在安装后的技能目录执行 `npm ci` 和 `npx playwright install chromium`，再按技能说明准备任务目录并执行 `node scripts/render.mjs <任务目录>`。这些步骤需要 Node.js/npm 和网络。静态卡片与 Live Photo 是不同能力，后者还涉及 Python、视频处理及部分 Swift 工具，未验证 Windows 全流程。

## Agent-Reach

要求 Python 3.10+。可从本包源码创建独立环境：

```powershell
python -m venv .runtime\agent-reach-env
.\.runtime\agent-reach-env\Scripts\python.exe -m pip install .\vendor\Agent-Reach
.\.runtime\agent-reach-env\Scripts\agent-reach.exe setup
# 按需要添加小红书渠道：
.\.runtime\agent-reach-env\Scripts\agent-reach.exe add xiaohongshu
```

安装会根据上游依赖声明下载依赖。小红书是可选渠道；具体渠道配置以[上游安装说明](../vendor/Agent-Reach/docs/install.md)为准。使用完整路径启动命令时不需要激活虚拟环境。

不要直接执行 `pip install agent-reach`：上游说明 PyPI 同名包并非该项目。Agent-Reach 负责读取和研究，真实发布交给 MCP/运营流程。会话和配置存放在用户本地，不能复制进源码仓库。

## 小红书 MCP

从[项目官方 Releases](https://github.com/xpzouying/xiaohongshu-mcp/releases)下载并解压 Windows x64 程序，然后分别指定登录程序和服务程序：

```powershell
.\scripts\Start-Mcp.ps1 -Action Login -Executable 'D:\Tools\xhs\xiaohongshu-login-windows-amd64.exe'
.\scripts\Start-Mcp.ps1 -Action Serve -Executable 'D:\Tools\xhs\xiaohongshu-mcp-windows-amd64.exe'
```

本人在弹出的浏览器中完成登录。首次运行可能需要下载浏览器。包装脚本为本次启动设置 `COOKIES_PATH`，将登录态保存在 `.runtime/xiaohongshu-mcp/cookies.json`，结束时恢复原环境变量。Git 已忽略该目录；若自定义运行目录，继续将其保留在本地。

客户端连接 `http://127.0.0.1:18060/mcp`。上游支持 `AUTH_TOKEN` 环境变量；设置后，客户端同时需要 `Authorization: Bearer ...`。包装脚本继承环境变量，不在源码或命令输出中保存令牌。

源码构建方式、Go 版本和详细 API 见[组件 README](../vendor/xiaohongshu-mcp/README.md)及 `go.mod`。包装脚本不修改系统防护设置。

## OpenClaw 运营技能

```powershell
.\scripts\Install-Skills.ps1 -Destination 'D:\OpenClaw\skills' -Skills xiaohongshu-ops
```

替换为你的实际 OpenClaw 技能目录。该组件当前明确使用 OpenClaw 内置浏览器及 `openclaw` profile；把文件复制到 Codex 不会自动提供该浏览器接口。没有 OpenClaw 时可阅读选题、账号分析和复盘方法，浏览器动作仍需适配。

先根据自己的业务修改安装副本的 `persona.md`。分析记录保存在本地知识库，上游 `.gitignore` 已排除生成的账号记录。已有“到发布按钮前停手”等执行边界继续保留。

## 验证范围

本工具包的交付检查覆盖目录完整性、文档链接、包装脚本语法及技能复制行为。没有在本次源码复制过程中执行依赖安装、图片渲染、扫码登录、账号互动或真实发布。
