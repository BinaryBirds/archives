import styles from './page.module.css';
import PostsGrid from '../components/posts/posts-grid';
import { getAllPosts } from '../utils/post-util';

export const metadata = {
  title: 'Binary Birds Blog',
  description: 'A list of all programming-related tutorials and posts!',
};

export default function Blog() {
  const posts = getAllPosts();
  return (
    <section className={styles.container}>
      <div className={styles.title}>
        <h1>Binary Birds Blog</h1>
        <p>
          Dive into the World of Full-Stack Swift Development with Us.
          <br />
          Discover Insights, Tips, and Tricks for Server-Side, Mobile, and Web
          Apps.
        </p>
      </div>
      <PostsGrid posts={posts} />
    </section>
  );
}
