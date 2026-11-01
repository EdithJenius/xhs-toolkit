<!-- Modified by xhs-toolkit on 2026-11-01: personal contacts, promotion and personal examples removed; technical and security instructions retained. -->

# xiaohongshu-mcp

[![Docker Pulls](https://img.shields.io/docker/pulls/xpzouying/xiaohongshu-mcp?style=flat-square&logo=docker)](https://hub.docker.com/r/xpzouying/xiaohongshu-mcp)

MCP for RedNote (Xiaohongshu) / xiaohongshu.com. Give your AI assistant direct access to RedNote data.

### 📖 Related Resources

- **Contributing Guide**: [Contributing Guide](./CONTRIBUTING.md)

### 🛠️ Troubleshooting

If you run into problems deploying the traditional Docker version, **be sure to check [Common Issues and Solutions (Issues #56)](https://github.com/xpzouying/xiaohongshu-mcp/issues/56) first**.


## Project Overview

**Main Features**

> 💡 **Tip:** Expand a feature below for usage details. Personal-environment recordings have been omitted.

<details>
<summary><b>1. Login and Check Login Status</b></summary>

The first step is required - RedNote needs to be logged in. You can check current login status.

**Login Demo:**

**Check Login Status Demo:**

</details>

<details>
<summary><b>2. Publish Image and Text Content</b></summary>

Supports publishing image and text content to RedNote, including title, content description, and images.

**Image Support Methods:**

Supports two image input methods:

1. **HTTP/HTTPS Image Links**

   ```
   ["https://example.com/image1.jpg", "https://example.com/image2.png"]
   ```

2. **Local Image Absolute Paths** (Recommended)
   ```
   ["/Users/username/Pictures/image1.jpg", "/home/user/images/image2.png"]
   ```

**Why Local Paths are Recommended:**

- ✅ Better stability, not dependent on network
- ✅ Faster upload speed
- ✅ Avoid image link expiration issues
- ✅ Support more image formats

**Publish Image-Text Post Demo:**

</details>

<details>
<summary><b>3. Publish Video Content</b></summary>

Supports publishing video content to RedNote, including title, content description, and local video files.

**Video Support Methods:**

Only supports local video file absolute paths:

```
"/Users/username/Videos/video.mp4"
```

**Features:**

- ✅ Supports local video file upload
- ✅ Automatic video format processing
- ✅ Supports title, content description, and tags
- ✅ Automatically publishes after video processing is complete

**Important Notes:**

- Only supports local video files, not HTTP links
- Video processing takes longer, please be patient
- Recommended video file size should not exceed 1GB

</details>

<details>
<summary><b>4. Search Content</b></summary>

Search RedNote content by keywords.

**Search Posts Demo:**

</details>

<details>
<summary><b>5. Get Recommendation List</b></summary>

Get RedNote homepage recommendation content list.

**Get Recommendation List Demo:**

</details>

<details>
<summary><b>6. Get Post Details (Including Interaction Data and Comments)</b></summary>

Get complete details of RedNote posts, including:

- Post content (title, description, images, etc.)
- User information
- Interaction data (likes, favorites, shares, comment count)
- Comment list and sub-comments

**⚠️ Important Note:**

- Both post ID and xsec_token are required (both parameters are essential)
- These two parameters can be obtained from Feed list or search results
- Must login first to use this feature

**Get Post Details Demo:**

</details>

<details>
<summary><b>7. Post Comments to Posts</b></summary>

Supports automatically posting comments to RedNote posts.

**Feature Description:**

- Automatically locate comment input box
- Input comment content and publish
- Supports HTTP API and MCP tool calls

**⚠️ Important Note:**

- Must login first to use this feature
- Need to provide post ID, xsec_token, and comment content
- These parameters can be obtained from Feed list or search results

**Post Comment Demo:**

</details>

<details>
<summary><b>8. Get User Profile</b></summary>

Get RedNote user's personal profile information, including basic user information and note content.

**Feature Description:**

- Get user basic information (nickname, bio, avatar, etc.)
- Get follower count, following count, likes count statistics
- Get user's published note content list
- Supports HTTP API and MCP tool calls

**⚠️ Important Note:**

- Must login first to use this feature
- Need to provide user ID and xsec_token
- These parameters can be obtained from Feed list or search results

**Returned Information Includes:**

- User basic info: nickname, bio, avatar, verification status
- Statistics: following count, follower count, likes count, note count
- Note list: all public notes published by the user

</details>

<details>
<summary><b>9. Reply to Comments</b></summary>

Reply to a specific comment under a note, supporting precise replies to specific users' comments.

**Feature Description:**

- Reply to a specific comment under a note
- Support locating target comment by comment ID or user ID
- Requires feed_id, xsec_token, comment_id/user_id, and reply content

**⚠️ Important Note:**

- Must login first to use this feature
- At least one of comment_id or user_id must be provided
- These parameters can be obtained from the comment list in post details

</details>

<details>
<summary><b>10. Like / Unlike</b></summary>

Like or unlike a note, with smart detection of current status to avoid duplicate operations.

**Feature Description:**

- Like or unlike a specified note
- Smart detection: skips liking if already liked, skips unliking if not liked
- Requires feed_id and xsec_token

**⚠️ Important Note:**

- Must login first to use this feature
- Default action is like, set unlike=true to unlike

</details>

<details>
<summary><b>11. Favorite / Unfavorite</b></summary>

Favorite a note or unfavorite it, with smart detection of current status to avoid duplicate operations.

**Feature Description:**

- Favorite or unfavorite a specified note
- Smart detection: skips favoriting if already favorited, skips unfavoriting if not favorited
- Requires feed_id and xsec_token

**⚠️ Important Note:**

- Must login first to use this feature
- Default action is favorite, set unfavorite=true to unfavorite

</details>

**RedNote Basic Operation Knowledge**

- **Title: (Very Important) RedNote requires titles to not exceed 20 characters**
- **Content: (Very Important) Content cannot exceed 1000 characters**
- Currently supports both image-text and video posting: From a recommendation perspective, image-text posts get better traffic than video or pure text.
- Tags: Now supported. Adding appropriate tags can bring more traffic.
- **(Very Important) RedNote does not allow the same account to login on multiple web platforms**. If you login to the current xiaohongshu-mcp, don't login to that account on other web platforms, otherwise it will "kick out" the current MCP account login. You can use the mobile app to check current account information.
- If your reach is low, first check whether your content contains banned words — there are plenty of free third-party tools you can search for.
- Never do traffic diversion or pure content scraping/reposting — these are exactly what the platform cracks down on.

**Risk Explanation**

1. If an account has not completed real-name verification, especially a new account, it will usually trigger a **real-name verification** prompt. ⚠️ This is not an account ban — you would be asked to verify even without using the MCP. Once verified, the account works normally. It is recommended to complete verification before using this project.
   

This project is for learning purposes only. All illegal activities are prohibited.

## 1. Usage Tutorial

### 1.1. Quick Start (Recommended)

**Method 1: Download Pre-compiled Binaries**

Download pre-compiled binaries for your platform directly from [GitHub Releases](https://github.com/xpzouying/xiaohongshu-mcp/releases):

**Main Program (MCP Service):**

- **macOS Apple Silicon**: `xiaohongshu-mcp-darwin-arm64`
- **Windows x64**: `xiaohongshu-mcp-windows-amd64.exe`
- **Linux x64**: `xiaohongshu-mcp-linux-amd64`

**Login Tool:**

- **macOS Apple Silicon**: `xiaohongshu-login-darwin-arm64`
- **Windows x64**: `xiaohongshu-login-windows-amd64.exe`
- **Linux x64**: `xiaohongshu-login-linux-amd64`

> Only the three platforms above are supported. macOS Intel and Linux ARM64 are not supported.

Usage Steps:

```bash
# 1. First run the login tool
chmod +x xiaohongshu-login-darwin-arm64
./xiaohongshu-login-darwin-arm64

# 2. Then start the MCP service
chmod +x xiaohongshu-mcp-darwin-arm64
./xiaohongshu-mcp-darwin-arm64
```

**⚠️ Important Note**: The headless browser will be automatically downloaded on first run (about 150MB), please ensure a stable network connection. Subsequent runs will not require re-downloading.

**Method 2: Build from Source**

<details>
<summary>Build from Source Details</summary>

Requires Golang environment. For installation instructions, please refer to [Golang Official Documentation](https://go.dev/doc/install).

Set Go domestic proxy source:

```bash
# Configure GOPROXY environment variable, choose one of the following three

# 1. Qiniu CDN
go env -w  GOPROXY=https://goproxy.cn,direct

# 2. Alibaba Cloud
go env -w GOPROXY=https://mirrors.aliyun.com/goproxy/,direct

# 3. Official
go env -w  GOPROXY=https://goproxy.io,direct
```

</details>

**Method 3: Using Docker Container (Simplest)**

<details>
<summary>Docker Deployment Details</summary>

Using Docker deployment is the simplest method, requiring no development environment installation.

**1. Pull Image from Docker Hub (Recommended)**

We provide pre-built Docker images that can be directly pulled from Docker Hub:

```bash
# Pull the latest image
docker pull xpzouying/xiaohongshu-mcp
```

Docker Hub URL: [https://hub.docker.com/r/xpzouying/xiaohongshu-mcp](https://hub.docker.com/r/xpzouying/xiaohongshu-mcp)

**2. Start with Docker Compose (Recommended)**

We provide a pre-configured `docker-compose.yml` file that can be used directly:

```bash
# Download docker-compose.yml
wget https://raw.githubusercontent.com/xpzouying/xiaohongshu-mcp/main/docker/docker-compose.yml

# Or if you've already cloned the project, enter the docker directory
cd docker

# Start service
docker compose up -d

# View logs
docker compose logs -f

# Stop service
docker compose stop
```

**3. Build Image Yourself (Optional)**

If you need to customize or modify the code, you can build the image yourself:

```bash
# Run in project root directory
docker build -t xpzouying/xiaohongshu-mcp .
```

**4. Configuration Notes**

The Docker version automatically:

- Configures the built-in browser and Chinese fonts
- Mounts `./data` for storing cookies and runtime data directories
- Mounts `./images` for storing publish images
- Exposes port 18060 for MCP connection

For detailed instructions, please refer to: [Docker Deployment Guide](./docker/README.md)

</details>

For Windows issues, check here first: [Windows Installation Guide](./docs/windows_guide.md)

### 1.2. Login

First time requires manual login to save RedNote login status.

**Using Binary Files:**

```bash
# Run the login tool for your platform
./xiaohongshu-login-darwin-arm64
```

**Using Source Code:**

```bash
go run cmd/login/main.go
```

### 1.3. Start MCP Service

Start xiaohongshu-mcp service.

**Using Binary Files:**

```bash
# Default: Headless mode, no browser interface
./xiaohongshu-mcp-darwin-arm64

# Non-headless mode, with browser interface
./xiaohongshu-mcp-darwin-arm64 -headless=false
```

**Using Source Code:**

```bash
# Default: Headless mode, no browser interface
go run .

# Non-headless mode, with browser interface
go run . -headless=false
```

**Configure a proxy (optional)**:

If you need to go through a proxy, set the `XHS_PROXY` environment variable:

```bash
# Start with a proxy configured
XHS_PROXY=http://user:pass@proxy:port ./xiaohongshu-mcp-darwin-arm64

# Or from source
XHS_PROXY=http://proxy:port go run .
```

HTTP/HTTPS/SOCKS5 proxies are supported, and proxy credentials are automatically masked in the logs.

**Optional authentication**:

Authentication is disabled by default. In production, configure it with the `AUTH_TOKEN` environment variable; a non-empty startup flag takes precedence, while an empty value falls back to `AUTH_TOKEN`.

```bash
# Environment variable
AUTH_TOKEN=your-secret-token ./xiaohongshu-mcp-darwin-arm64
AUTH_TOKEN=your-secret-token go run .

# Non-empty startup flag (takes precedence over the environment variable)
./xiaohongshu-mcp-darwin-arm64 -token=your-secret-token
go run . -token=your-secret-token
```

When authentication is enabled, every MCP client must configure the custom request header `Authorization: Bearer <token>`. Command-line arguments may be visible in process listings, so prefer `AUTH_TOKEN` in deployment environments.

For example, MCP clients that support custom request headers can use the following configuration:

```json
{
  "mcpServers": {
    "xiaohongshu-mcp": {
      "url": "http://localhost:18060/mcp",
      "headers": { "Authorization": "Bearer your-secret-token" }
    }
  }
}
```

## 1.4. Verify MCP

```bash
npx @modelcontextprotocol/inspector
```


After running, open the local link printed in the terminal, configure MCP inspector, enter `http://localhost:18060/mcp`, and click the `Connect` button.


**Note:** Check if the options in the left sidebar are correct.

After configuring MCP inspector as above, click the `List Tools` button to view all Tools.

## 1.5. Use MCP for Publishing

### Check Login Status


### Publish Image-Text

The example uses a random image from https://unsplash.com/ for testing.


### Search Content

Use search functionality to search RedNote content by keywords:


## 2. MCP Client Integration

This service supports the standard Model Context Protocol (MCP) and can integrate with various AI clients that support MCP.

### 2.1. Quick Start

#### Start MCP Service

```bash
# Start service (default headless mode)
go run .

# Or with interface mode
go run . -headless=false
```

Service will run at: `http://localhost:18060/mcp`

#### Verify Service Status

```bash
# Test MCP connection
curl -X POST http://localhost:18060/mcp \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer your-secret-token" \
  -d '{"jsonrpc":"2.0","method":"initialize","params":{},"id":1}'
```

#### Claude Code CLI Integration

```bash
# Add HTTP MCP server
claude mcp add --transport http xiaohongshu-mcp http://localhost:18060/mcp

# Check if MCP was added successfully (ensure MCP is already started before running this command)
claude mcp list
```

### 2.2. Supported Clients

<details>
<summary><b>Claude Code CLI</b></summary>

Official command line tool, already shown in the quick start section above:

```bash
# Add HTTP MCP server
claude mcp add --transport http xiaohongshu-mcp http://localhost:18060/mcp

# Check if MCP was added successfully (ensure MCP is already started before running this command)
claude mcp list
```

</details>

<details>
<summary><b>Open Code CLI</b></summary>

Add the MCP server with the interactive command:

```bash
opencode mcp add
```

Using `xiaohongshu-mcp` as an example:

```
┌  Add MCP server
│
◇  Enter MCP server name
│  xiaohongshu-mcp
│
◇  Select MCP server type
│  Remote
│
◇  Enter MCP server URL
│  http://localhost:18060/mcp
│
◇  Does this server require OAuth authentication?
│  No
│
◆  MCP server "xiaohongshu-mcp" added to C:\Users\YOUR_USER\.config\opencode\opencode.json
│
└  MCP server added successfully
```

Verify that it was added successfully (make sure the MCP service is running):

```bash
opencode mcp list
```

```
┌  MCP Servers
│
●  ✓ xiaohongshu-mcp connected
```

</details>

<details>
<summary><b>Cursor</b></summary>

#### Configuration File Method

Create or edit MCP configuration file:

**Project-level configuration** (recommended):
Create `.cursor/mcp.json` in project root directory:

```json
{
  "mcpServers": {
    "xiaohongshu-mcp": {
      "url": "http://localhost:18060/mcp",
      "description": "RedNote content publishing service - MCP Streamable HTTP"
    }
  }
}
```

**Global configuration**:
Create `~/.cursor/mcp.json` in user directory (same content).

#### Usage Steps

1. Ensure RedNote MCP service is running
2. Save configuration file and restart Cursor
3. In Cursor chat, tools should be automatically available
4. You can view connected MCP tools through "Available Tools" in the chat interface

**Demo**

Plugin MCP integration:


Call MCP tools: (using check login status as example)

![cursor_mcp_check_login](./assets/cursor_mcp_check_login.png)

</details>

<details>
<summary><b>VSCode</b></summary>

#### Method 1: Configure using Command Palette

1. Press `Ctrl/Cmd + Shift + P` to open command palette
2. Run `MCP: Add Server` command
3. Select `HTTP` method.
4. Enter address: `http://localhost:18060/mcp`, or modify to corresponding Server address.
5. Enter MCP name: `xiaohongshu-mcp`.

#### Method 2: Direct Configuration File Edit

**Workspace configuration** (recommended):
Create `.vscode/mcp.json` in project root directory:

```json
{
  "servers": {
    "xiaohongshu-mcp": {
      "url": "http://localhost:18060/mcp",
      "type": "http"
    }
  },
  "inputs": []
}
```

**View Configuration**:

![vscode_config](./assets/vscode_mcp_config.png)

1. Confirm running status.
2. Check if `tools` are correctly detected.

**Demo**

Using search post content as example:

![vscode_mcp_search](./assets/vscode_search_demo.png)

</details>

<details>
<summary><b>Google Gemini CLI</b></summary>

Configure in `~/.gemini/settings.json` or project directory `.gemini/settings.json`:

```json
{
  "mcpServers": {
    "xiaohongshu": {
      "httpUrl": "http://localhost:18060/mcp",
      "timeout": 30000
    }
  }
}
```

For more information, please refer to [Gemini CLI MCP Documentation](https://google-gemini.github.io/gemini-cli/docs/tools/mcp-server.html)

</details>

<details>
<summary><b>MCP Inspector</b></summary>

Debug tool for testing MCP connections:

```bash
# Start MCP Inspector
npx @modelcontextprotocol/inspector

# Connect in browser to: http://localhost:18060/mcp
```

Usage steps:

- Use MCP Inspector to test connection
- Test Ping Server functionality to verify connection
- Check if List Tools returns 13 tools

</details>

<details>
<summary><b>Cline</b></summary>

Cline is a powerful AI programming assistant that supports MCP protocol integration.

#### Configuration Method

Add the following configuration to Cline's MCP settings:

```json
{
  "xiaohongshu-mcp": {
    "url": "http://localhost:18060/mcp",
    "type": "streamableHttp",
    "autoApprove": [],
    "disabled": false
  }
}
```

#### Usage Steps

1. Ensure RedNote MCP service is running (`http://localhost:18060/mcp`)
2. Open MCP settings in Cline
3. Add the above configuration to the MCP server list
4. Save configuration and restart Cline
5. You can directly use RedNote-related features in conversations

#### Configuration Explanation

- `url`: MCP service address
- `type`: Use `streamableHttp` type for better performance
- `autoApprove`: Configurable auto-approve tool list (empty means manual approval)
- `disabled`: Set to `false` to enable this MCP service

#### Usage Examples

After configuration, you can use natural language to operate RedNote directly in Cline:

```
Help me check RedNote login status
```

```
Help me publish a spring-themed image-text post to RedNote, using this image: /path/to/spring.jpg
```

```
Search for content about "food" on RedNote
```

</details>
<details>
<summary><b>OpenClaw (via MCPorter)</b></summary>

> Make sure xiaohongshu-mcp is already deployed locally before you start. Handing the GitHub link to OpenClaw and letting it deploy the project for you is **not recommended**.

Since OpenClaw does not natively support MCP yet, the officially recommended way to call MCP services is through **MCPorter**.

> 💡 **Tip:** MCPorter is not the ideal way to call MCP — you may run into compatibility issues along the way, so please be aware.

#### Installation and Setup

Just hand the following three commands to OpenClaw in one go (via the Control UI, Telegram, Feishu, etc.), and OpenClaw will set up MCPorter for you.

```
npm i -g mcporter
npx mcporter config add xiaohongshu-mcp http://localhost:18060/mcp
npx mcporter list xiaohongshu-mcp
```

Once that is done, you can use every xiaohongshu-mcp feature from OpenClaw through natural language.

</details>
<details>
<summary><b>Other HTTP MCP Supporting Clients</b></summary>

Any client supporting HTTP MCP protocol can connect to: `http://localhost:18060/mcp`

Basic configuration template:

```json
{
  "name": "xiaohongshu-mcp",
  "url": "http://localhost:18060/mcp",
  "type": "http"
}
```

</details>

### 2.3. Available MCP Tools

After successful connection, you can use the following MCP tools:

- `check_login_status` - Check RedNote login status (no parameters)
- `get_login_qrcode` - Get login QR code, returns Base64 image and timeout (no parameters)
- `delete_cookies` - Delete cookies file, reset login status, requires re-login after deletion (no parameters)
- `publish_content` - Publish image-text content to RedNote (required: title, content, images)
  - `images`: Image path list (minimum 1), supports HTTP links or local absolute paths, local paths recommended
  - `tags`: Topic tags list (optional), e.g. `["food", "travel", "lifestyle"]`
  - `schedule_at`: Scheduled publish time (optional), ISO8601 format, supports 1 hour to 14 days ahead
  - `is_original`: Declare as original content (optional), default is not declared
  - `visibility`: Visibility scope (optional), supports `公开可见` / public (default), `仅自己可见` / self-only, `仅互关好友可见` / mutual-followers-only
  - `products`: Product keyword list (optional), used to attach products for social commerce. Provide a product name or product ID; the system searches automatically and picks the first match. Requires the product feature to be enabled on your account. Example: [面膜, 防晒霜SPF50]
- `publish_with_video` - Publish video content to RedNote (required: title, content, video)
  - `video`: Local video file absolute path (single file only)
  - `tags`: Topic tags list (optional), e.g. `["food", "travel", "lifestyle"]`
  - `schedule_at`: Scheduled publish time (optional), ISO8601 format, supports 1 hour to 14 days ahead
  - `visibility`: Visibility scope (optional), supports `公开可见` / public (default), `仅自己可见` / self-only, `仅互关好友可见` / mutual-followers-only
  - `products`: Product keyword list (optional), used to attach products for social commerce. Provide a product name or product ID; the system searches automatically and picks the first match. Requires the product feature to be enabled on your account. Example: [面膜, 防晒霜SPF50]
- `list_feeds` - Get RedNote homepage recommendation list (no parameters)
- `search_feeds` - Search RedNote content (required: keyword)
  - `filters`: Filter options (optional). Values must be passed exactly as the Chinese strings below — they match the labels on the RedNote filter panel.
    - `sort_by`: Sort by - `综合` / comprehensive (default) | `最新` / latest | `最多点赞` / most liked | `最多评论` / most comments | `最多收藏` / most saved
    - `note_type`: Note type - `不限` / any (default) | `视频` / video | `图文` / image-text
    - `publish_time`: Publish time - `不限` / any (default) | `一天内` / last day | `一周内` / last week | `半年内` / last 6 months
    - `search_scope`: Search scope - `不限` / any (default) | `已看过` / viewed | `未看过` / not viewed | `已关注` / followed
    - `location`: Location - `不限` / any (default) | `同城` / same city | `附近` / nearby
- `get_feed_detail` - Get post details including interaction data and comments (required: feed_id, xsec_token)
  - `load_all_comments`: Whether to load all comments (optional), default false returns only first 10 top-level comments
  - `limit`: Limit number of top-level comments to load (optional), only effective when load_all_comments=true, default 20
  - `click_more_replies`: Whether to expand nested replies (optional), only effective when load_all_comments=true, default false
  - `reply_limit`: Skip comments with too many replies (optional), only effective when click_more_replies=true, default 10
  - `scroll_speed`: Scroll speed (optional), `slow` | `normal` | `fast`, only effective when load_all_comments=true
- `post_comment_to_feed` - Post comments to RedNote posts (required: feed_id, xsec_token, content)
- `reply_comment_in_feed` - Reply to a specific comment under a note (required: feed_id, xsec_token, content, and at least one of comment_id or user_id)
- `like_feed` - Like / unlike a note (required: feed_id, xsec_token)
  - `unlike`: Whether to unlike (optional), true to unlike, default is like
- `favorite_feed` - Favorite / unfavorite a note (required: feed_id, xsec_token)
  - `unfavorite`: Whether to unfavorite (optional), true to unfavorite, default is favorite
- `user_profile` - Get user profile information (required: user_id, xsec_token)

### 2.4. Usage Examples

Using Claude Code to publish content to RedNote:

**Example 1: Using HTTP Image Links**

```
Help me write a post to publish on RedNote,
with image: https://cn.bing.com/th?id=OHR.MaoriRock_EN-US6499689741_UHD.jpg&w=3840
The image is: "Maori rock carving at Ngātoroirangi Mine Bay, Lake Taupo, New Zealand (© Joppi/Getty Images)"

Use xiaohongshu-mcp for publishing.
```

**Example 2: Using Local Image Paths (Recommended)**

```
Help me write a post about spring to publish on RedNote,
using these local images:
- /Users/username/Pictures/spring_flowers.jpg
- /Users/username/Pictures/cherry_blossom.jpg

Use xiaohongshu-mcp for publishing.
```

**Example 3: Publishing Video Content**

```
Help me write a video post about cooking tutorials to publish on RedNote,
using this local video file:
- /Users/username/Videos/cooking_tutorial.mp4

Use xiaohongshu-mcp's video publishing feature.
```


**Publishing Result:**

The personal account screenshot has been omitted.

### 2.5. 💬 MCP FAQ

---

> ⚠️ The following are known risks when using OpenClaw + MCPorter. Please read them carefully before you start:

- OpenClaw's automated AI deployment behavior is outside the scope of this project's maintenance, and its results cannot be guaranteed
- As an intermediate layer, MCPorter may introduce additional compatibility issues that have nothing to do with xiaohongshu-mcp itself
- If you hit connection failures or abnormal tool calls, please check MCPorter's own configuration first instead of filing an Issue
- Before asking in the community or the groups, please confirm whether the problem also reproduces **without OpenClaw**

If you do not specifically need OpenClaw, we strongly recommend switching to a client with native HTTP MCP support such as [Claude Code CLI](#claude-code-cli), [Cursor](#cursor) or [Cline](#cline) — the experience is much more stable.

---

**Q:** Why does the check login username display `xiaghgngshu-mcp`?
**A:** The username is hardcoded.

---

**Q:** It shows publish success but the post doesn't actually appear?
**A:** Troubleshooting steps:

1. Re-publish using **non-headless mode**.
2. Try publishing with **different content**.
3. Login to RedNote web version and check if the account has been **restricted from web publishing due to risk control**.
4. Check if the **image size** is too large.
5. Make sure there are **no Chinese characters in the image path**.
6. If using network image URLs, confirm the **image links are accessible**.

---

**Q:** The MCP program crashes on my device, how to resolve?
**A:**

1. It is recommended to **build from source**.
2. Or use **Docker to install xiaohongshu-mcp**, refer to:
   - [Install xiaohongshu-mcp with Docker](https://github.com/xpzouying/xiaohongshu-mcp#:~:text=%E6%96%B9%E5%BC%8F%E4%B8%89%EF%BC%9A%E4%BD%BF%E7%94%A8%20Docker%20%E5%AE%B9%E5%99%A8%EF%BC%88%E6%9C%80%E7%AE%80%E5%8D%95%EF%BC%89)
   - [X-MCP Project Page](https://github.com/xpzouying/x-mcp/)

---

**Q:** When verifying MCP with `http://localhost:18060/mcp`, it shows connection error?
**A:**

- In a **Docker environment**, please use
  [http://host.docker.internal:18060/mcp](http://host.docker.internal:18060/mcp)
- In a **non-Docker environment**, please use your **local IPv4 address** to access.

---

## 3. 🌟 Community Showcases

> 💡 **Highly Recommended**: These are real-world use cases from community contributors, featuring detailed configuration steps and practical experiences!

### 📚 Complete Tutorial List

1. **[n8n Complete Integration Tutorial](./examples/n8n/README.md)** - Workflow automation platform integration
2. **[Cherry Studio Complete Configuration Tutorial](./examples/cherrystudio/README.md)** - Perfect AI client integration
3. **[Claude Code + Kimi K2 Integration Tutorial](./examples/claude-code/claude-code-kimi-k2.md)** - If Claude Code's barrier is too high, then integrate with Kimi domestic LLM!
4. **[AnythingLLM Complete Guide](./examples/anythingLLM/readme.md)** - AnythingLLM is an all-in-one multimodal AI client that supports workflow definition, multiple LLMs, and plugin extensions.

> 🎯 **Tip**: Click the links above to view detailed step-by-step tutorials for quick setup of various integration solutions!
>
> 📢 **Contributions Welcome**: If you have new integration cases, feel free to submit a PR to share with the community!

## 📄 License

This project is open source under the [Apache License 2.0](LICENSE).

You are free to use, modify and distribute this project, including for commercial purposes, as long as you keep the original copyright notice and license file. The [LICENSE](LICENSE) file is the authoritative source for the full terms.

Contributions submitted to this project are licensed under the same license by default.
