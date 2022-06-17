Insert into T_JSTREE_MONITOR
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT,
   C_LEVEL, C_TITLE, C_TYPE, C_LINK)
Values
  (1, 0, 0, 1, 8,
   0, 'Root Node', 'root', 'blank_url');
Insert into T_JSTREE_MONITOR
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT,
   C_LEVEL, C_TITLE, C_TYPE, C_LINK)
Values
  (2, 1, 0, 2, 7,
   1, 'First Child', 'drive', 'blank_url');
Insert into T_JSTREE_MONITOR
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT,
   C_LEVEL, C_TITLE, C_TYPE, C_LINK)
Values
  (3, 2, 0, 3, 4,
   2, 'Leaf Node', 'default', 'blank_url');
Insert into T_JSTREE_MONITOR
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT,
   C_LEVEL, C_TITLE, C_TYPE, C_LINK)
Values
  (4, 2, 1, 5, 6,
   2, 'Branch Node', 'folder', 'blank_url');
COMMIT;