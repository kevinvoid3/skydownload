import os
import sys


def main():
    # 從 GitHub Actions Secret 取得 Python 程式碼
    secret_code = os.environ.get("PYTHON")

    if not secret_code:
        print("Error: PYTHON secret is empty.")
        sys.exit(1)

    try:
        # 建立執行環境
        context = {
            "__name__": "__main__",
            "__file__": "secret_script.py",
        }

        # 編譯後執行，錯誤訊息會比較容易定位
        exec(
            compile(secret_code, "secret_script.py", "exec"),
            context
        )

    except Exception as e:
        print(f"Execution Error: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
