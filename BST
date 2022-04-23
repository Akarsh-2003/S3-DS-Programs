#include<stdio.h>
#include<stdlib.h>

typedef struct tnode
 {
  int data;
  struct tnode *right, *left;
 }TNODE;
 
TNODE *CreateBST(TNODE *, int);
void Inorder(TNODE *);
void Preorder(TNODE *);
void Postorder(TNODE *);

int main()
{
 TNODE *root = NULL;
 int ch, elem, n, i;
 printf("Binary Search Tree Operations\n");
 printf("\n1.Create BST\n2.InOrder\n3.PreOrder\n4.PostOrder\n5.Exit");
 while(1)
 {
  printf("\n\nEnter your choice:");
  scanf("%d", &ch);
  switch(ch)
  {
   case 1: root=NULL;
           printf("Enter no. of nodes:");
           scanf("%d", &n);
           printf("Enter elements:");
           for(i=1;i<=n;i++)
           {
            scanf("%d",&elem);
            root = CreateBST(root,elem);
           }
           printf("BST with %d nodes is ready to use...", n);
           break;
   case 2: printf("BST Traversal in INORDER:");
           Inorder(root);
           break;
   case 3: printf("BST Traversal in PREORDER:");
           Preorder(root);
           break;
   case 4: printf("BST Traversal in POSTORDER:");
           Postorder(root);
           break;
   case 5: exit(0);
   default:printf("\nInvalid Choice!");
           break;
  }
 }
}

TNODE *CreateBST(TNODE *root, int elem)
{
 if(root==NULL)
 {
    root = (TNODE *)malloc(sizeof(TNODE));
    root->left = root->right = NULL;
    root->data = elem;
    return root;
 }
 else
 {
    if(elem<root->data)
    root->left=CreateBST(root->left,elem);
    else if(elem>root->data)
    root->right=CreateBST(root->right, elem);
    else
    printf("Duplicate Element! Not Allowed!");
    return root;
 }
}
 
void Inorder(TNODE *root)
{
 if(root!=NULL)
  {
   Inorder(root->left);
   printf("%d ",root->data);
   Inorder(root->right);
  } 
}

void Preorder(TNODE *root)
{
 if(root!=NULL)
  {
   printf("%d ",root->data);
   Preorder(root->left);
   Preorder(root->right);
  }
}

void Postorder(TNODE *root)
{ 
  if(root!=NULL)
  {
   Postorder(root->left);
   Postorder(root->right);
   printf("%d ",root->data);
  }
}
