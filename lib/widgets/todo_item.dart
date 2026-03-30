import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String task;
  final bool isDone;
  final VoidCallback? onToggle;
  final VoidCallback? onDelete;

  const TodoItem({
    super.key,
    required this.task,
    required this.isDone,
    this.onToggle,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: isDone ? Colors.grey[100] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: GestureDetector(
          onTap: onToggle,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isDone ? Colors.green : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: isDone ? Colors.green : Colors.grey[400]!,
                width: 2,
              ),
            ),
            child: Icon(
              Icons.check,
              size: 20,
              color: isDone ? Colors.white : Colors.transparent,
            ),
          ),
        ),
        title: Text(
          task,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isDone ? Colors.grey : Colors.black87,
            decoration: isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
