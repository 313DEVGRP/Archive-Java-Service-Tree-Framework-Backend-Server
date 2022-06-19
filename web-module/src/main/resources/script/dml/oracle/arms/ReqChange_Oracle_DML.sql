
Insert into T_ARMS_REQCHANGE
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT,
   C_LEVEL, C_TITLE, C_TYPE)
Values
  (1, 0, 0, 1, 8,
   0, 'Root Node', 'root');
Insert into T_ARMS_REQCHANGE
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT,
   C_LEVEL, C_TITLE, C_TYPE)
Values
  (2, 1, 0, 2, 7,
   1, 'First Child', 'drive');
Insert into T_ARMS_REQCHANGE
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT,
   C_LEVEL, C_TITLE, C_TYPE)
Values
  (3, 2, 0, 3, 4,
   2, 'Leaf Node', 'default');
Insert into T_ARMS_REQCHANGE
  (C_ID, C_PARENTID, C_POSITION, C_LEFT, C_RIGHT,
   C_LEVEL, C_TITLE, C_TYPE)
Values
  (4, 2, 1, 5, 6,
   2, 'Branch Node', 'folder');
COMMIT;