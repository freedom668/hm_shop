import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmMoreList extends StatefulWidget {
  // 推荐列表
  final List<GoodDetailItem> recommendList;

  const HmMoreList({Key? key, required this.recommendList}) : super(key: key);

  @override
  _HmMoreListState createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {
  Widget _getChildren(int index) {
    // 获取当前商品数据
    final item = widget.recommendList[index];

    return Container(
      // 白色背景和圆角直接给 Container，不需要额外的 Padding 包裹
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        // 可以在这里加个阴影让卡片更立体
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 图片部分
          Expanded(
            // 使用 Expanded 让图片占据剩余空间的大部分
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Image.network(
                  item.picture,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "lib/assets/home_cmd_inner.png", // 确保这个路径存在
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
          ),
          // 内容部分
          Padding(
            padding: const EdgeInsets.all(8.0), // 内部留白
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14, // 调整字体大小，20太大了
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "¥${item.price}",
                        style: const TextStyle(
                          color: Colors.red, // 价格通常用红色
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: " ¥${item.price}", // 原价
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.normal, // 去掉加粗
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "${item.payCount}人付款",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 必须是Sliver家族的组件
    return SliverGrid.builder(
      itemCount: widget.recommendList.length,
      // 网格配置
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 两列
        mainAxisSpacing: 10, // 行间距
        crossAxisSpacing: 10, // 列间距
        childAspectRatio: 0.75, // 宽高比
      ),
      itemBuilder: (BuildContext context, int index) {
        // ✅ 优化：移除了外层的 Padding
        // SliverGrid 的 crossAxisSpacing 已经处理了列之间的空隙
        // 如果希望列表距离屏幕左右边缘也有空隙，可以在父级 CustomScrollView 或 SliverPadding 处理
        return _getChildren(index);
      },
    );
  }
}
