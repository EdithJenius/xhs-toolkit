# 第三方来源与许可说明

本工具包由第三方项目源码、技能文件及本地整理的文档和脚本组成。仓库所有者已说明获得作者许可。本次导入没有将私人授权邮件、聊天或个人联系信息放入仓库。

| 组件 | 来源 | 随包许可 |
| --- | --- | --- |
| Agent-Reach | [上游仓库](https://github.com/Panniantong/Agent-Reach) | [MIT](vendor/Agent-Reach/LICENSE) |
| baoyu-xhs-images | [上游技能目录](https://github.com/JimLiu/baoyu-skills/tree/main/skills/baoyu-xhs-images) | [MIT](vendor/baoyu-xhs-images/LICENSE) |
| guizang-social-card-skill | [上游仓库](https://github.com/op7418/guizang-social-card-skill) | [LICENSE](vendor/guizang-social-card-skill/LICENSE)、[商业许可说明](vendor/guizang-social-card-skill/COMMERCIAL_LICENSING.md) |
| xiaohongshu-mcp | [上游仓库](https://github.com/xpzouying/xiaohongshu-mcp) | [Apache-2.0](vendor/xiaohongshu-mcp/LICENSE) |
| xiaohongshu-ops-skill | [上游仓库](https://github.com/Xiangyu-CAS/xiaohongshu-ops-skill) | 上游快照没有独立 LICENSE 文件；本次依据仓库所有者说明的授权导入 |

各项目保持各自的许可和必要版权声明，没有为整套第三方源码指定统一许可证。来源链接中的仓库所有者名称用于说明来源；这些链接不构成作者对本工具包的背书。

社交卡片组件的 LICENSE/README 标示 AGPL-3.0，原始 package.json 的 license 字段为 ISC，两处存在差异。本次不擅自选择其中之一或改写许可证；实际授权范围以随包条款及已取得的授权为准。

本地调整主要是移除非必要个人资料、宣传内容、个人化示例，以及补充统一导航和启动脚本。具体范围见每个组件的 UPSTREAM.md。软件原有的认证、会话保护、发布确认与数据排除规则保留。
