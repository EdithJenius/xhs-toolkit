# guizang-social-card-skill 上游与使用说明

- 上游仓库：https://github.com/op7418/guizang-social-card-skill
- 导入分支与日期：`main`，2026-11-01。
- 许可证：上游 `LICENSE` 与 README 声明为 AGPL-3.0；完整原文已保留。

## 本次复制范围

从上游跟踪文件导入后，按用户要求清理了个人宣传、联系方式和个人化示例。未复制 `.git`、本机依赖、缓存或生成产物。功能标识、运行依赖和已有安全检查保留。

上游 `package.json` 的 `license` 字段目前写作 `ISC`，与仓库 `LICENSE` / README 不一致。本工具包保留这一原始差异，并按完整 `LICENSE` 的 AGPL-3.0 说明来源，不据此宣称组件已转为 ISC。用户已说明获得作者许可；本工具包不推定该许可改变了公开许可证，也不代替双方的单独授权约定。

## 用途与接入

通过 HTML/CSS 排版与浏览器渲染生成小红书 3:4 卡片、公众号封面对和其他社交图片；还包含 Live Photo 的独立制作流程。

在支持项目技能的 Codex 中，把本目录完整复制到目标项目的 `.agents/skills/guizang-social-card-skill/`；不要只复制 `SKILL.md`。也可以让 Agent 直接读取本目录的 `SKILL.md`。模板、参考文档和脚本均为运行所需内容。

静态图片渲染需要 Node.js、npm、Playwright Chromium 与 `subset-font`。在本目录安装上游锁定依赖、安装浏览器后，可运行：

```text
npm ci
npx playwright install chromium
node scripts/render.mjs <任务目录>
```

任务目录需先有按 `assets/` 模板制作的 `index.html`。该渲染命令不是从一段文本直接自动生成所有内容的独立应用；Agent 按 `SKILL.md` 完成内容与版式准备，再调用脚本。

首次渲染可能下载字体到本机缓存；本机登记的商业字体还需使用者拥有相应授权。图片来源与素材按上游工作流记录于任务目录的 `SOURCES.md`。

Live Photo 另外涉及 Python / `makelive`、视频处理和平台适配；部分脚本使用 Swift。不要把 Windows 静态卡片支持推定为完整 Live Photo 流程已经可运行，具体依赖见 `references/live-photo-production.md`。本次复制没有安装依赖或执行生成、发布。

## 保留的上游边界

- `LICENSE` 与 `NOTICE.md` 的必要版权归属保留，源仓库链接集中保留在本文件；`COMMERCIAL_LICENSING.md` 保留授权适用范围和条件，已有独立授权约定不因此改变。
- `AGENT.md` 与 `.gitignore` 保留：任务、下载素材及渲染输出默认放在 `local-tests/`，不污染技能根目录。
- 原有字体可读性、布局校验和图片尺寸检查保留；不新增发布检查关卡。
- 沿用上游先交付预览、由使用者决定是否运行完整版式 validator 的流程。
- 图片选择、用户素材优先、来源记录、Live Photo 手机端发布限制等说明保留。

更新时可重新导入上游跟踪文件，并用普通 Git diff 检查源码和许可证变化。

## 本地内容清理

- `README.md` / `README.en.md`：移除个人品牌标题、徽章、宣传预览图和姊妹项目导流，安装说明改为本工具包组件路径，版权归属集中于 `NOTICE.md`。
- `COMMERCIAL_LICENSING.md`：移除个人商业宣传、其他项目导流、参考报价和赞助宣传，保留授权适用范围、条件与非最终协议说明；完整公开许可证仍保留。
- `HANDOFF.md`：个人电脑绝对路径改为通用路径或明确占位符。
- `references/gz-components.md`：个人署名与栏目名示例改为“内容团队”和通用示例。
- `SKILL.md`、`AGENT.md`、`PRODUCT.md`、`agents/openai.yaml`、`package.json` 及视觉参考文档/模板注释：展示性个人品牌描述改为通用功能描述。
- `guizang-social-card-skill`、`guizang-design`、`GUIZANG_*`、`gz-*` 等技术标识保留，维持技能发现、配置、缓存和组件调用的兼容性；没有修改执行逻辑、校验规则或许可证内容。
