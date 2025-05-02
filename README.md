# Vivado Project Scaffold Generator

一个用于快速创建 Vivado 工程目录结构的 Windows 批处理脚本，帮助你节省重复搭建工程结构的时间。

## 📁 自动生成的目录结构

运行脚本后，将在当前路径下创建以下目录结构：

your_project/

├── src/ # 存放 Verilog/VHDL 源代码

├── ip/ # 存放 IP 核

│ └── coe/ # 存放 COE 文件

├── constrs/ # 约束文件（如 XDC）

├── sim/ # 仿真文件

├── scripts/ # TCL 脚本等辅助脚本

├── doc/ # 文档或设计说明

├── README.md # 项目说明（预留）

└── .gitignore # Git 忽略规则


## 🚀 使用方法

1. 下载或克隆本仓库。
2. 双击运行脚本 `create_vivado_project.bat`。
3. 按提示输入项目名称（例如 `my_fpga_project`）。
4. 脚本将自动在当前目录下创建结构化的工程文件夹，并打开生成的目录。

## 📝 .gitignore 自动生成说明

脚本自动生成 `.gitignore` 文件，忽略不必要的中间文件，同时保留以下内容：

- 保留 `.xpr` 工程文件
- 保留 IP 中的 `.xci` 和 `.coe` 文件
- 保留 `README.md` 和 `.gitignore` 自身
- 忽略 IP 目录下的其它内容

## ⚠️ 注意事项

- 仅支持 Windows 系统（`.bat` 脚本）
- 需要命令行支持 UTF-8（已自动启用）
- 已添加日志记录文件：`project_creation_log.txt`

## 📄 示例运行截图

```bash
Please enter the project name (e.g., my_fpga_project):
> my_fpga_design
✅ Project "my_fpga_design" created successfully!
