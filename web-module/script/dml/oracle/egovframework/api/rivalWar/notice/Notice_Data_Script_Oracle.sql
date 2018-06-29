Insert into T_JSTREE_NOTICE
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT, C_LEVEL, C_TITLE, C_TYPE,
  NOTICE_BODY)
Values
  (1, 0, 0, 1, 8, 0, 'Root Node', 'root',
  'Root');
Insert into T_JSTREE_NOTICE
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT, C_LEVEL, C_TITLE, C_TYPE,
  NOTICE_BODY)
Values
  (2, 1, 0, 2, 7, 1, 'First Child', 'drive',
  'First Child');
Insert into T_JSTREE_NOTICE
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT, C_LEVEL, C_TITLE, C_TYPE,
  NOTICE_BODY)
Values
  (3, 2, 0, 3, 4, 2, 'Leaf Node', 'default',
  'Node');
Insert into T_JSTREE_NOTICE
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT, C_LEVEL, C_TITLE, C_TYPE,
  NOTICE_BODY)
Values
  (4, 2, 1, 5, 6, 2, 'Branch Node', 'folder',
  'Branch');
COMMIT;