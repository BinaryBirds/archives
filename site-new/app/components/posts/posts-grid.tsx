import { PostData } from '@/app/utils/post-util';
import PostItem from './post-item';
import styles from './posts-grid.module.css';

type PostsGridProps = {
  posts: PostData[];
};

function PostsGrid({ posts }: PostsGridProps) {
  return (
    <ul className={styles.grid}>
      {posts.map((post) => (
        <PostItem key={post.slug} post={post} />
      ))}
    </ul>
  );
}

export default PostsGrid;
