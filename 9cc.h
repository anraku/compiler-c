// 抽象構文木のノードの種類
typedef enum {
  ND_ADD,    // +
  ND_SUB,    // -
  ND_MUL,    // *
  ND_DIV,    // /
  ND_LT,     // <
  ND_LTE,    // <=
  ND_EQ,     // ==
  ND_NE,     // !=
  ND_ASSIGN, // =
  // ND_LVAR,   // ローカル変数
  ND_NUM,    // 整数
} NodeKind;

typedef struct Node Node;

// 抽象構文木のノードの型
struct Node {
  NodeKind kind; // ノードの型
  Node *lhs;     // 左辺
  Node *rhs;     // 右辺
  int val;       // kindがND_NUMの場合のみ使う
  int offset;    // kindがND_LVARの場合のみ使う
};

// トークンの種類
typedef enum {
  TK_RESERVED, // 記号
  // TK_IDENT,    // 識別子
  TK_NUM,      // 整数トークン
  TK_EOF,      // 入力の終わりを表すトークン
} TokenKind;

typedef struct Token Token;

// トークン型
struct Token {
  TokenKind kind; // トークンの型
  Token *next;    // 次の入力トークン
  int val;        // kindがTK_NUMの場合、その数値
  char *str;      // トークン文字列
  int len;       // トークンの長さ
};

extern Token *token;
extern char *user_input;
extern Node *code[100];

Node *program();
Node *expr();

Token *tokenize(char *user_input);
// アセンブリジェネレータ
void gen(Node *node);
// エラー出力関数
void error(char *fmt, ...);
