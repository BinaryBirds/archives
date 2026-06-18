import Markdown from 'react-markdown';
import Image from 'next/image';
import PostHeader from './post-header';
import styles from './post-content.module.css';
import { PostData } from '@/app/utils/post-util';
import { ElementType } from 'react';
import rehypeHighlight from 'rehype-highlight';

type PostContentProps = {
  post: PostData;
};

function PostContent({ post }: PostContentProps) {
  const imagePath = `/images/posts/${post.slug}/cover.jpg`;
  const customRenderers: { [nodeType: string]: ElementType } = {
    p(paragraph) {
      const { node } = paragraph;

      if (node.children[0].tagName === 'img') {
        const image = node.children[0];
        const isExternal = /^(https?:)?\/\//i.test(image.properties.src);
        const src = isExternal
          ? image.properties.src
          : `/images/posts/${post.slug}/${image.properties.src}`;

        return (
          <div className={styles.imageContainer}>
            <Image
              className={styles.image}
              src={src}
              alt={image.properties.alt}
              fill
            />
          </div>
        );
      }

      return <p>{paragraph.children}</p>;
    },
  };

  return (
    <article className={styles.content}>
      <PostHeader
        title={post.title}
        date={post.date}
        tags={post.tags}
        description={post.description}
        image={imagePath}
      />
      <Markdown
        className={styles.markdown}
        components={customRenderers}
        rehypePlugins={[rehypeHighlight]}
      >
        {post.content}
      </Markdown>
    </article>
  );
}

export default PostContent;
