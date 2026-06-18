import Link from 'next/link';
import Image from 'next/image';
import { Tag } from 'primereact/tag';
import styles from './post-item.module.css';
import { PostData } from '@/app/utils/post-util';

type PostItemProps = {
  post: PostData;
};

function PostItem({ post }: PostItemProps) {
  const { title, description, date, slug, tags } = post;
  const formattedDate = new Date(date).toLocaleDateString('en-US', {
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  });

  const imagePath = `/images/posts/${slug}/cover.jpg`;
  const linkPath = `/posts/${slug}`;

  return (
    <li className={styles.post}>
      <Link href={linkPath}>
        <div className={styles.imageContainer}>
          <Image
            className={styles.image}
            src={imagePath}
            alt={title}
            fill
            sizes='(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw'
            priority
          />
        </div>
        <div className={styles.content}>
          <div className={styles.tags}>
            {tags.split(',').map((tag) => (
              <Tag key={tag} value={tag} className={styles.tag} />
            ))}
          </div>
          <h3>{title}</h3>
          <time>{formattedDate}</time>
          <p>{description}</p>
        </div>
      </Link>
    </li>
  );
}

export default PostItem;
