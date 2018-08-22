Insert into T_JSTREE_COMPARE_ITEM
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT, C_LEVEL, C_TITLE, C_TYPE,
  MAPPING_MENU_ID, COMPARE_ITEM_NAME)
Values
  (1, 0, 0, 1, 8, 0, 'Root Node', 'root',
  3, 'Root');
Insert into T_JSTREE_COMPARE_ITEM
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT, C_LEVEL, C_TITLE, C_TYPE,
  MAPPING_MENU_ID, COMPARE_ITEM_NAME)
Values
  (2, 1, 0, 2, 7, 1, 'First Child', 'drive',
  3, 'First Child');
Insert into T_JSTREE_COMPARE_ITEM
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT, C_LEVEL, C_TITLE, C_TYPE,
  MAPPING_MENU_ID, COMPARE_ITEM_NAME)
Values
  (3, 2, 0, 3, 4, 2, 'Leaf Node', 'default',
  3, 'Node');
Insert into T_JSTREE_COMPARE_ITEM
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT, C_LEVEL, C_TITLE, C_TYPE,
  MAPPING_MENU_ID, COMPARE_ITEM_NAME)
Values
  (4, 2, 1, 5, 6, 2, 'Branch Node', 'folder',
  3, 'Branch');
COMMIT;