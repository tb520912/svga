import * as $protobuf from "protobufjs";
import Long = require("long");
/** Namespace com. */
export namespace com {

    /** Namespace opensource. */
    namespace opensource {

        /** Namespace svga. */
        namespace svga {

            /** Properties of a MovieParams. */
            interface IMovieParams {

                /** MovieParams viewBoxWidth */
                viewBoxWidth?: (number|null);

                /** MovieParams viewBoxHeight */
                viewBoxHeight?: (number|null);

                /** MovieParams fps */
                fps?: (number|null);

                /** MovieParams frames */
                frames?: (number|null);
            }

            /** Represents a MovieParams. */
            class MovieParams implements IMovieParams {

                /**
                 * Constructs a new MovieParams.
                 * @param [properties] Properties to set
                 */
                constructor(properties?: com.opensource.svga.IMovieParams);

                /** MovieParams viewBoxWidth. */
                public viewBoxWidth: number;

                /** MovieParams viewBoxHeight. */
                public viewBoxHeight: number;

                /** MovieParams fps. */
                public fps: number;

                /** MovieParams frames. */
                public frames: number;

                /**
                 * Creates a new MovieParams instance using the specified properties.
                 * @param [properties] Properties to set
                 * @returns MovieParams instance
                 */
                public static create(properties?: com.opensource.svga.IMovieParams): com.opensource.svga.MovieParams;

                /**
                 * Encodes the specified MovieParams message. Does not implicitly {@link com.opensource.svga.MovieParams.verify|verify} messages.
                 * @param message MovieParams message or plain object to encode
                 * @param [writer] Writer to encode to
                 * @returns Writer
                 */
                public static encode(message: com.opensource.svga.IMovieParams, writer?: $protobuf.Writer): $protobuf.Writer;

                /**
                 * Encodes the specified MovieParams message, length delimited. Does not implicitly {@link com.opensource.svga.MovieParams.verify|verify} messages.
                 * @param message MovieParams message or plain object to encode
                 * @param [writer] Writer to encode to
                 * @returns Writer
                 */
                public static encodeDelimited(message: com.opensource.svga.IMovieParams, writer?: $protobuf.Writer): $protobuf.Writer;

                /**
                 * Decodes a MovieParams message from the specified reader or buffer.
                 * @param reader Reader or buffer to decode from
                 * @param [length] Message length if known beforehand
                 * @returns MovieParams
                 * @throws {Error} If the payload is not a reader or valid buffer
                 * @throws {$protobuf.util.ProtocolError} If required fields are missing
                 */
                public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): com.opensource.svga.MovieParams;

                /**
                 * Decodes a MovieParams message from the specified reader or buffer, length delimited.
                 * @param reader Reader or buffer to decode from
                 * @returns MovieParams
                 * @throws {Error} If the payload is not a reader or valid buffer
                 * @throws {$protobuf.util.ProtocolError} If required fields are missing
                 */
                public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): com.opensource.svga.MovieParams;

                /**
                 * Verifies a MovieParams message.
                 * @param message Plain object to verify
                 * @returns `null` if valid, otherwise the reason why it is not
                 */
                public static verify(message: { [k: string]: any }): (string|null);

                /**
                 * Creates a MovieParams message from a plain object. Also converts values to their respective internal types.
                 * @param object Plain object
                 * @returns MovieParams
                 */
                public static fromObject(object: { [k: string]: any }): com.opensource.svga.MovieParams;

                /**
                 * Creates a plain object from a MovieParams message. Also converts values to other types if specified.
                 * @param message MovieParams
                 * @param [options] Conversion options
                 * @returns Plain object
                 */
                public static toObject(message: com.opensource.svga.MovieParams, options?: $protobuf.IConversionOptions): { [k: string]: any };

                /**
                 * Converts this MovieParams to JSON.
                 * @returns JSON object
                 */
                public toJSON(): { [k: string]: any };

                /**
                 * Gets the default type url for MovieParams
                 * @param [typeUrlPrefix] your custom typeUrlPrefix(default "type.googleapis.com")
                 * @returns The default type url
                 */
                public static getTypeUrl(typeUrlPrefix?: string): string;
            }

            /** Properties of a SpriteEntity. */
            interface ISpriteEntity {

                /** SpriteEntity imageKey */
                imageKey?: (string|null);

                /** SpriteEntity frames */
                frames?: (com.opensource.svga.IFrameEntity[]|null);

                /** SpriteEntity matteKey */
                matteKey?: (string|null);
            }

            /** Represents a SpriteEntity. */
            class SpriteEntity implements ISpriteEntity {

                /**
                 * Constructs a new SpriteEntity.
                 * @param [properties] Properties to set
                 */
                constructor(properties?: com.opensource.svga.ISpriteEntity);

                /** SpriteEntity imageKey. */
                public imageKey: string;

                /** SpriteEntity frames. */
                public frames: com.opensource.svga.IFrameEntity[];

                /** SpriteEntity matteKey. */
                public matteKey: string;

                /**
                 * Creates a new SpriteEntity instance using the specified properties.
                 * @param [properties] Properties to set
                 * @returns SpriteEntity instance
                 */
                public static create(properties?: com.opensource.svga.ISpriteEntity): com.opensource.svga.SpriteEntity;

                /**
                 * Encodes the specified SpriteEntity message. Does not implicitly {@link com.opensource.svga.SpriteEntity.verify|verify} messages.
                 * @param message SpriteEntity message or plain object to encode
                 * @param [writer] Writer to encode to
                 * @returns Writer
                 */
                public static encode(message: com.opensource.svga.ISpriteEntity, writer?: $protobuf.Writer): $protobuf.Writer;

                /**
                 * Encodes the specified SpriteEntity message, length delimited. Does not implicitly {@link com.opensource.svga.SpriteEntity.verify|verify} messages.
                 * @param message SpriteEntity message or plain object to encode
                 * @param [writer] Writer to encode to
                 * @returns Writer
                 */
                public static encodeDelimited(message: com.opensource.svga.ISpriteEntity, writer?: $protobuf.Writer): $protobuf.Writer;

                /**
                 * Decodes a SpriteEntity message from the specified reader or buffer.
                 * @param reader Reader or buffer to decode from
                 * @param [length] Message length if known beforehand
                 * @returns SpriteEntity
                 * @throws {Error} If the payload is not a reader or valid buffer
                 * @throws {$protobuf.util.ProtocolError} If required fields are missing
                 */
                public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): com.opensource.svga.SpriteEntity;

                /**
                 * Decodes a SpriteEntity message from the specified reader or buffer, length delimited.
                 * @param reader Reader or buffer to decode from
                 * @returns SpriteEntity
                 * @throws {Error} If the payload is not a reader or valid buffer
                 * @throws {$protobuf.util.ProtocolError} If required fields are missing
                 */
                public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): com.opensource.svga.SpriteEntity;

                /**
                 * Verifies a SpriteEntity message.
                 * @param message Plain object to verify
                 * @returns `null` if valid, otherwise the reason why it is not
                 */
                public static verify(message: { [k: string]: any }): (string|null);

                /**
                 * Creates a SpriteEntity message from a plain object. Also converts values to their respective internal types.
                 * @param object Plain object
                 * @returns SpriteEntity
                 */
                public static fromObject(object: { [k: string]: any }): com.opensource.svga.SpriteEntity;

                /**
                 * Creates a plain object from a SpriteEntity message. Also converts values to other types if specified.
                 * @param message SpriteEntity
                 * @param [options] Conversion options
                 * @returns Plain object
                 */
                public static toObject(message: com.opensource.svga.SpriteEntity, options?: $protobuf.IConversionOptions): { [k: string]: any };

                /**
                 * Converts this SpriteEntity to JSON.
                 * @returns JSON object
                 */
                public toJSON(): { [k: string]: any };

                /**
                 * Gets the default type url for SpriteEntity
                 * @param [typeUrlPrefix] your custom typeUrlPrefix(default "type.googleapis.com")
                 * @returns The default type url
                 */
                public static getTypeUrl(typeUrlPrefix?: string): string;
            }

            /** Properties of an AudioEntity. */
            interface IAudioEntity {

                /** AudioEntity audioKey */
                audioKey?: (string|null);

                /** AudioEntity startFrame */
                startFrame?: (number|null);

                /** AudioEntity endFrame */
                endFrame?: (number|null);

                /** AudioEntity startTime */
                startTime?: (number|null);

                /** AudioEntity totalTime */
                totalTime?: (number|null);
            }

            /** Represents an AudioEntity. */
            class AudioEntity implements IAudioEntity {

                /**
                 * Constructs a new AudioEntity.
                 * @param [properties] Properties to set
                 */
                constructor(properties?: com.opensource.svga.IAudioEntity);

                /** AudioEntity audioKey. */
                public audioKey: string;

                /** AudioEntity startFrame. */
                public startFrame: number;

                /** AudioEntity endFrame. */
                public endFrame: number;

                /** AudioEntity startTime. */
                public startTime: number;

                /** AudioEntity totalTime. */
                public totalTime: number;

                /**
                 * Creates a new AudioEntity instance using the specified properties.
                 * @param [properties] Properties to set
                 * @returns AudioEntity instance
                 */
                public static create(properties?: com.opensource.svga.IAudioEntity): com.opensource.svga.AudioEntity;

                /**
                 * Encodes the specified AudioEntity message. Does not implicitly {@link com.opensource.svga.AudioEntity.verify|verify} messages.
                 * @param message AudioEntity message or plain object to encode
                 * @param [writer] Writer to encode to
                 * @returns Writer
                 */
                public static encode(message: com.opensource.svga.IAudioEntity, writer?: $protobuf.Writer): $protobuf.Writer;

                /**
                 * Encodes the specified AudioEntity message, length delimited. Does not implicitly {@link com.opensource.svga.AudioEntity.verify|verify} messages.
                 * @param message AudioEntity message or plain object to encode
                 * @param [writer] Writer to encode to
                 * @returns Writer
                 */
                public static encodeDelimited(message: com.opensource.svga.IAudioEntity, writer?: $protobuf.Writer): $protobuf.Writer;

                /**
                 * Decodes an AudioEntity message from the specified reader or buffer.
                 * @param reader Reader or buffer to decode from
                 * @param [length] Message length if known beforehand
                 * @returns AudioEntity
                 * @throws {Error} If the payload is not a reader or valid buffer
                 * @throws {$protobuf.util.ProtocolError} If required fields are missing
                 */
                public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): com.opensource.svga.AudioEntity;

                /**
                 * Decodes an AudioEntity message from the specified reader or buffer, length delimited.
                 * @param reader Reader or buffer to decode from
                 * @returns AudioEntity
                 * @throws {Error} If the payload is not a reader or valid buffer
                 * @throws {$protobuf.util.ProtocolError} If required fields are missing
                 */
                public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): com.opensource.svga.AudioEntity;

                /**
                 * Verifies an AudioEntity message.
                 * @param message Plain object to verify
                 * @returns `null` if valid, otherwise the reason why it is not
                 */
                public static verify(message: { [k: string]: any }): (string|null);

                /**
                 * Creates an AudioEntity message from a plain object. Also converts values to their respective internal types.
                 * @param object Plain object
                 * @returns AudioEntity
                 */
                public static fromObject(object: { [k: string]: any }): com.opensource.svga.AudioEntity;

                /**
                 * Creates a plain object from an AudioEntity message. Also converts values to other types if specified.
                 * @param message AudioEntity
                 * @param [options] Conversion options
                 * @returns Plain object
                 */
                public static toObject(message: com.opensource.svga.AudioEntity, options?: $protobuf.IConversionOptions): { [k: string]: any };

                /**
                 * Converts this AudioEntity to JSON.
                 * @returns JSON object
                 */
                public toJSON(): { [k: string]: any };

                /**
                 * Gets the default type url for AudioEntity
                 * @param [typeUrlPrefix] your custom typeUrlPrefix(default "type.googleapis.com")
                 * @returns The default type url
                 */
                public static getTypeUrl(typeUrlPrefix?: string): string;
            }

            /** Properties of a Layout. */
            interface ILayout {

                /** Layout x */
                x?: (number|null);

                /** Layout y */
                y?: (number|null);

                /** Layout width */
                width?: (number|null);

                /** Layout height */
                height?: (number|null);
            }

            /** Represents a Layout. */
            class Layout implements ILayout {

                /**
                 * Constructs a new Layout.
                 * @param [properties] Properties to set
                 */
                constructor(properties?: com.opensource.svga.ILayout);

                /** Layout x. */
                public x: number;

                /** Layout y. */
                public y: number;

                /** Layout width. */
                public width: number;

                /** Layout height. */
                public height: number;

                /**
                 * Creates a new Layout instance using the specified properties.
                 * @param [properties] Properties to set
                 * @returns Layout instance
                 */
                public static create(properties?: com.opensource.svga.ILayout): com.opensource.svga.Layout;

                /**
                 * Encodes the specified Layout message. Does not implicitly {@link com.opensource.svga.Layout.verify|verify} messages.
                 * @param message Layout message or plain object to encode
                 * @param [writer] Writer to encode to
                 * @returns Writer
                 */
                public static encode(message: com.opensource.svga.ILayout, writer?: $protobuf.Writer): $protobuf.Writer;

                /**
                 * Encodes the specified Layout message, length delimited. Does not implicitly {@link com.opensource.svga.Layout.verify|verify} messages.
                 * @param message Layout message or plain object to encode
                 * @param [writer] Writer to encode to
                 * @returns Writer
                 */
                public static encodeDelimited(message: com.opensource.svga.ILayout, writer?: $protobuf.Writer): $protobuf.Writer;

                /**
                 * Decodes a Layout message from the specified reader or buffer.
                 * @param reader Reader or buffer to decode from
                 * @param [length] Message length if known beforehand
                 * @returns Layout
                 * @throws {Error} If the payload is not a reader or valid buffer
                 * @throws {$protobuf.util.ProtocolError} If required fields are missing
                 */
                public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): com.opensource.svga.Layout;

                /**
                 * Decodes a Layout message from the specified reader or buffer, length delimited.
                 * @param reader Reader or buffer to decode from
                 * @returns Layout
                 * @throws {Error} If the payload is not a reader or valid buffer
                 * @throws {$protobuf.util.ProtocolError} If required fields are missing
                 */
                public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): com.opensource.svga.Layout;

                /**
                 * Verifies a Layout message.
                 * @param message Plain object to verify
                 * @returns `null` if valid, otherwise the reason why it is not
                 */
                public static verify(message: { [k: string]: any }): (string|null);

                /**
                 * Creates a Layout message from a plain object. Also converts values to their respective internal types.
                 * @param object Plain object
                 * @returns Layout
                 */
                public static fromObject(object: { [k: string]: any }): com.opensource.svga.Layout;

                /**
                 * Creates a plain object from a Layout message. Also converts values to other types if specified.
                 * @param message Layout
                 * @param [options] Conversion options
                 * @returns Plain object
                 */
                public static toObject(message: com.opensource.svga.Layout, options?: $protobuf.IConversionOptions): { [k: string]: any };

                /**
                 * Converts this Layout to JSON.
                 * @returns JSON object
                 */
                public toJSON(): { [k: string]: any };

                /**
                 * Gets the default type url for Layout
                 * @param [typeUrlPrefix] your custom typeUrlPrefix(default "type.googleapis.com")
                 * @returns The default type url
                 */
                public static getTypeUrl(typeUrlPrefix?: string): string;
            }

            /** Properties of a Transform. */
            interface ITransform {

                /** Transform a */
                a?: (number|null);

                /** Transform b */
                b?: (number|null);

                /** Transform c */
                c?: (number|null);

                /** Transform d */
                d?: (number|null);

                /** Transform tx */
                tx?: (number|null);

                /** Transform ty */
                ty?: (number|null);
            }

            /** Represents a Transform. */
            class Transform implements ITransform {

                /**
                 * Constructs a new Transform.
                 * @param [properties] Properties to set
                 */
                constructor(properties?: com.opensource.svga.ITransform);

                /** Transform a. */
                public a: number;

                /** Transform b. */
                public b: number;

                /** Transform c. */
                public c: number;

                /** Transform d. */
                public d: number;

                /** Transform tx. */
                public tx: number;

                /** Transform ty. */
                public ty: number;

                /**
                 * Creates a new Transform instance using the specified properties.
                 * @param [properties] Properties to set
                 * @returns Transform instance
                 */
                public static create(properties?: com.opensource.svga.ITransform): com.opensource.svga.Transform;

                /**
                 * Encodes the specified Transform message. Does not implicitly {@link com.opensource.svga.Transform.verify|verify} messages.
                 * @param message Transform message or plain object to encode
                 * @param [writer] Writer to encode to
                 * @returns Writer
                 */
                public static encode(message: com.opensource.svga.ITransform, writer?: $protobuf.Writer): $protobuf.Writer;

                /**
                 * Encodes the specified Transform message, length delimited. Does not implicitly {@link com.opensource.svga.Transform.verify|verify} messages.
                 * @param message Transform message or plain object to encode
                 * @param [writer] Writer to encode to
                 * @returns Writer
                 */
                public static encodeDelimited(message: com.opensource.svga.ITransform, writer?: $protobuf.Writer): $protobuf.Writer;

                /**
                 * Decodes a Transform message from the specified reader or buffer.
                 * @param reader Reader or buffer to decode from
                 * @param [length] Message length if known beforehand
                 * @returns Transform
                 * @throws {Error} If the payload is not a reader or valid buffer
                 * @throws {$protobuf.util.ProtocolError} If required fields are missing
                 */
                public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): com.opensource.svga.Transform;

                /**
                 * Decodes a Transform message from the specified reader or buffer, length delimited.
                 * @param reader Reader or buffer to decode from
                 * @returns Transform
                 * @throws {Error} If the payload is not a reader or valid buffer
                 * @throws {$protobuf.util.ProtocolError} If required fields are missing
                 */
                public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): com.opensource.svga.Transform;

                /**
                 * Verifies a Transform message.
                 * @param message Plain object to verify
                 * @returns `null` if valid, otherwise the reason why it is not
                 */
                public static verify(message: { [k: string]: any }): (string|null);

                /**
                 * Creates a Transform message from a plain object. Also converts values to their respective internal types.
                 * @param object Plain object
                 * @returns Transform
                 */
                public static fromObject(object: { [k: string]: any }): com.opensource.svga.Transform;

                /**
                 * Creates a plain object from a Transform message. Also converts values to other types if specified.
                 * @param message Transform
                 * @param [options] Conversion options
                 * @returns Plain object
                 */
                public static toObject(message: com.opensource.svga.Transform, options?: $protobuf.IConversionOptions): { [k: string]: any };

                /**
                 * Converts this Transform to JSON.
                 * @returns JSON object
                 */
                public toJSON(): { [k: string]: any };

                /**
                 * Gets the default type url for Transform
                 * @param [typeUrlPrefix] your custom typeUrlPrefix(default "type.googleapis.com")
                 * @returns The default type url
                 */
                public static getTypeUrl(typeUrlPrefix?: string): string;
            }

            /** Properties of a ShapeEntity. */
            interface IShapeEntity {

                /** ShapeEntity type */
                type?: (com.opensource.svga.ShapeEntity.ShapeType|null);

                /** ShapeEntity shape */
                shape?: (com.opensource.svga.ShapeEntity.IShapeArgs|null);

                /** ShapeEntity rect */
                rect?: (com.opensource.svga.ShapeEntity.IRectArgs|null);

                /** ShapeEntity ellipse */
                ellipse?: (com.opensource.svga.ShapeEntity.IEllipseArgs|null);

                /** ShapeEntity styles */
                styles?: (com.opensource.svga.ShapeEntity.IShapeStyle|null);

                /** ShapeEntity transform */
                transform?: (com.opensource.svga.ITransform|null);
            }

            /** Represents a ShapeEntity. */
            class ShapeEntity implements IShapeEntity {

                /**
                 * Constructs a new ShapeEntity.
                 * @param [properties] Properties to set
                 */
                constructor(properties?: com.opensource.svga.IShapeEntity);

                /** ShapeEntity type. */
                public type: com.opensource.svga.ShapeEntity.ShapeType;

                /** ShapeEntity shape. */
                public shape?: (com.opensource.svga.ShapeEntity.IShapeArgs|null);

                /** ShapeEntity rect. */
                public rect?: (com.opensource.svga.ShapeEntity.IRectArgs|null);

                /** ShapeEntity ellipse. */
                public ellipse?: (com.opensource.svga.ShapeEntity.IEllipseArgs|null);

                /** ShapeEntity styles. */
                public styles?: (com.opensource.svga.ShapeEntity.IShapeStyle|null);

                /** ShapeEntity transform. */
                public transform?: (com.opensource.svga.ITransform|null);

                /** ShapeEntity args. */
                public args?: ("shape"|"rect"|"ellipse");

                /**
                 * Creates a new ShapeEntity instance using the specified properties.
                 * @param [properties] Properties to set
                 * @returns ShapeEntity instance
                 */
                public static create(properties?: com.opensource.svga.IShapeEntity): com.opensource.svga.ShapeEntity;

                /**
                 * Encodes the specified ShapeEntity message. Does not implicitly {@link com.opensource.svga.ShapeEntity.verify|verify} messages.
                 * @param message ShapeEntity message or plain object to encode
                 * @param [writer] Writer to encode to
                 * @returns Writer
                 */
                public static encode(message: com.opensource.svga.IShapeEntity, writer?: $protobuf.Writer): $protobuf.Writer;

                /**
                 * Encodes the specified ShapeEntity message, length delimited. Does not implicitly {@link com.opensource.svga.ShapeEntity.verify|verify} messages.
                 * @param message ShapeEntity message or plain object to encode
                 * @param [writer] Writer to encode to
                 * @returns Writer
                 */
                public static encodeDelimited(message: com.opensource.svga.IShapeEntity, writer?: $protobuf.Writer): $protobuf.Writer;

                /**
                 * Decodes a ShapeEntity message from the specified reader or buffer.
                 * @param reader Reader or buffer to decode from
                 * @param [length] Message length if known beforehand
                 * @returns ShapeEntity
                 * @throws {Error} If the payload is not a reader or valid buffer
                 * @throws {$protobuf.util.ProtocolError} If required fields are missing
                 */
                public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): com.opensource.svga.ShapeEntity;

                /**
                 * Decodes a ShapeEntity message from the specified reader or buffer, length delimited.
                 * @param reader Reader or buffer to decode from
                 * @returns ShapeEntity
                 * @throws {Error} If the payload is not a reader or valid buffer
                 * @throws {$protobuf.util.ProtocolError} If required fields are missing
                 */
                public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): com.opensource.svga.ShapeEntity;

                /**
                 * Verifies a ShapeEntity message.
                 * @param message Plain object to verify
                 * @returns `null` if valid, otherwise the reason why it is not
                 */
                public static verify(message: { [k: string]: any }): (string|null);

                /**
                 * Creates a ShapeEntity message from a plain object. Also converts values to their respective internal types.
                 * @param object Plain object
                 * @returns ShapeEntity
                 */
                public static fromObject(object: { [k: string]: any }): com.opensource.svga.ShapeEntity;

                /**
                 * Creates a plain object from a ShapeEntity message. Also converts values to other types if specified.
                 * @param message ShapeEntity
                 * @param [options] Conversion options
                 * @returns Plain object
                 */
                public static toObject(message: com.opensource.svga.ShapeEntity, options?: $protobuf.IConversionOptions): { [k: string]: any };

                /**
                 * Converts this ShapeEntity to JSON.
                 * @returns JSON object
                 */
                public toJSON(): { [k: string]: any };

                /**
                 * Gets the default type url for ShapeEntity
                 * @param [typeUrlPrefix] your custom typeUrlPrefix(default "type.googleapis.com")
                 * @returns The default type url
                 */
                public static getTypeUrl(typeUrlPrefix?: string): string;
            }

            namespace ShapeEntity {

                /** ShapeType enum. */
                enum ShapeType {
                    SHAPE = 0,
                    RECT = 1,
                    ELLIPSE = 2,
                    KEEP = 3
                }

                /** Properties of a ShapeArgs. */
                interface IShapeArgs {

                    /** ShapeArgs d */
                    d?: (string|null);
                }

                /** Represents a ShapeArgs. */
                class ShapeArgs implements IShapeArgs {

                    /**
                     * Constructs a new ShapeArgs.
                     * @param [properties] Properties to set
                     */
                    constructor(properties?: com.opensource.svga.ShapeEntity.IShapeArgs);

                    /** ShapeArgs d. */
                    public d: string;

                    /**
                     * Creates a new ShapeArgs instance using the specified properties.
                     * @param [properties] Properties to set
                     * @returns ShapeArgs instance
                     */
                    public static create(properties?: com.opensource.svga.ShapeEntity.IShapeArgs): com.opensource.svga.ShapeEntity.ShapeArgs;

                    /**
                     * Encodes the specified ShapeArgs message. Does not implicitly {@link com.opensource.svga.ShapeEntity.ShapeArgs.verify|verify} messages.
                     * @param message ShapeArgs message or plain object to encode
                     * @param [writer] Writer to encode to
                     * @returns Writer
                     */
                    public static encode(message: com.opensource.svga.ShapeEntity.IShapeArgs, writer?: $protobuf.Writer): $protobuf.Writer;

                    /**
                     * Encodes the specified ShapeArgs message, length delimited. Does not implicitly {@link com.opensource.svga.ShapeEntity.ShapeArgs.verify|verify} messages.
                     * @param message ShapeArgs message or plain object to encode
                     * @param [writer] Writer to encode to
                     * @returns Writer
                     */
                    public static encodeDelimited(message: com.opensource.svga.ShapeEntity.IShapeArgs, writer?: $protobuf.Writer): $protobuf.Writer;

                    /**
                     * Decodes a ShapeArgs message from the specified reader or buffer.
                     * @param reader Reader or buffer to decode from
                     * @param [length] Message length if known beforehand
                     * @returns ShapeArgs
                     * @throws {Error} If the payload is not a reader or valid buffer
                     * @throws {$protobuf.util.ProtocolError} If required fields are missing
                     */
                    public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): com.opensource.svga.ShapeEntity.ShapeArgs;

                    /**
                     * Decodes a ShapeArgs message from the specified reader or buffer, length delimited.
                     * @param reader Reader or buffer to decode from
                     * @returns ShapeArgs
                     * @throws {Error} If the payload is not a reader or valid buffer
                     * @throws {$protobuf.util.ProtocolError} If required fields are missing
                     */
                    public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): com.opensource.svga.ShapeEntity.ShapeArgs;

                    /**
                     * Verifies a ShapeArgs message.
                     * @param message Plain object to verify
                     * @returns `null` if valid, otherwise the reason why it is not
                     */
                    public static verify(message: { [k: string]: any }): (string|null);

                    /**
                     * Creates a ShapeArgs message from a plain object. Also converts values to their respective internal types.
                     * @param object Plain object
                     * @returns ShapeArgs
                     */
                    public static fromObject(object: { [k: string]: any }): com.opensource.svga.ShapeEntity.ShapeArgs;

                    /**
                     * Creates a plain object from a ShapeArgs message. Also converts values to other types if specified.
                     * @param message ShapeArgs
                     * @param [options] Conversion options
                     * @returns Plain object
                     */
                    public static toObject(message: com.opensource.svga.ShapeEntity.ShapeArgs, options?: $protobuf.IConversionOptions): { [k: string]: any };

                    /**
                     * Converts this ShapeArgs to JSON.
                     * @returns JSON object
                     */
                    public toJSON(): { [k: string]: any };

                    /**
                     * Gets the default type url for ShapeArgs
                     * @param [typeUrlPrefix] your custom typeUrlPrefix(default "type.googleapis.com")
                     * @returns The default type url
                     */
                    public static getTypeUrl(typeUrlPrefix?: string): string;
                }

                /** Properties of a RectArgs. */
                interface IRectArgs {

                    /** RectArgs x */
                    x?: (number|null);

                    /** RectArgs y */
                    y?: (number|null);

                    /** RectArgs width */
                    width?: (number|null);

                    /** RectArgs height */
                    height?: (number|null);

                    /** RectArgs cornerRadius */
                    cornerRadius?: (number|null);
                }

                /** Represents a RectArgs. */
                class RectArgs implements IRectArgs {

                    /**
                     * Constructs a new RectArgs.
                     * @param [properties] Properties to set
                     */
                    constructor(properties?: com.opensource.svga.ShapeEntity.IRectArgs);

                    /** RectArgs x. */
                    public x: number;

                    /** RectArgs y. */
                    public y: number;

                    /** RectArgs width. */
                    public width: number;

                    /** RectArgs height. */
                    public height: number;

                    /** RectArgs cornerRadius. */
                    public cornerRadius: number;

                    /**
                     * Creates a new RectArgs instance using the specified properties.
                     * @param [properties] Properties to set
                     * @returns RectArgs instance
                     */
                    public static create(properties?: com.opensource.svga.ShapeEntity.IRectArgs): com.opensource.svga.ShapeEntity.RectArgs;

                    /**
                     * Encodes the specified RectArgs message. Does not implicitly {@link com.opensource.svga.ShapeEntity.RectArgs.verify|verify} messages.
                     * @param message RectArgs message or plain object to encode
                     * @param [writer] Writer to encode to
                     * @returns Writer
                     */
                    public static encode(message: com.opensource.svga.ShapeEntity.IRectArgs, writer?: $protobuf.Writer): $protobuf.Writer;

                    /**
                     * Encodes the specified RectArgs message, length delimited. Does not implicitly {@link com.opensource.svga.ShapeEntity.RectArgs.verify|verify} messages.
                     * @param message RectArgs message or plain object to encode
                     * @param [writer] Writer to encode to
                     * @returns Writer
                     */
                    public static encodeDelimited(message: com.opensource.svga.ShapeEntity.IRectArgs, writer?: $protobuf.Writer): $protobuf.Writer;

                    /**
                     * Decodes a RectArgs message from the specified reader or buffer.
                     * @param reader Reader or buffer to decode from
                     * @param [length] Message length if known beforehand
                     * @returns RectArgs
                     * @throws {Error} If the payload is not a reader or valid buffer
                     * @throws {$protobuf.util.ProtocolError} If required fields are missing
                     */
                    public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): com.opensource.svga.ShapeEntity.RectArgs;

                    /**
                     * Decodes a RectArgs message from the specified reader or buffer, length delimited.
                     * @param reader Reader or buffer to decode from
                     * @returns RectArgs
                     * @throws {Error} If the payload is not a reader or valid buffer
                     * @throws {$protobuf.util.ProtocolError} If required fields are missing
                     */
                    public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): com.opensource.svga.ShapeEntity.RectArgs;

                    /**
                     * Verifies a RectArgs message.
                     * @param message Plain object to verify
                     * @returns `null` if valid, otherwise the reason why it is not
                     */
                    public static verify(message: { [k: string]: any }): (string|null);

                    /**
                     * Creates a RectArgs message from a plain object. Also converts values to their respective internal types.
                     * @param object Plain object
                     * @returns RectArgs
                     */
                    public static fromObject(object: { [k: string]: any }): com.opensource.svga.ShapeEntity.RectArgs;

                    /**
                     * Creates a plain object from a RectArgs message. Also converts values to other types if specified.
                     * @param message RectArgs
                     * @param [options] Conversion options
                     * @returns Plain object
                     */
                    public static toObject(message: com.opensource.svga.ShapeEntity.RectArgs, options?: $protobuf.IConversionOptions): { [k: string]: any };

                    /**
                     * Converts this RectArgs to JSON.
                     * @returns JSON object
                     */
                    public toJSON(): { [k: string]: any };

                    /**
                     * Gets the default type url for RectArgs
                     * @param [typeUrlPrefix] your custom typeUrlPrefix(default "type.googleapis.com")
                     * @returns The default type url
                     */
                    public static getTypeUrl(typeUrlPrefix?: string): string;
                }

                /** Properties of an EllipseArgs. */
                interface IEllipseArgs {

                    /** EllipseArgs x */
                    x?: (number|null);

                    /** EllipseArgs y */
                    y?: (number|null);

                    /** EllipseArgs radiusX */
                    radiusX?: (number|null);

                    /** EllipseArgs radiusY */
                    radiusY?: (number|null);
                }

                /** Represents an EllipseArgs. */
                class EllipseArgs implements IEllipseArgs {

                    /**
                     * Constructs a new EllipseArgs.
                     * @param [properties] Properties to set
                     */
                    constructor(properties?: com.opensource.svga.ShapeEntity.IEllipseArgs);

                    /** EllipseArgs x. */
                    public x: number;

                    /** EllipseArgs y. */
                    public y: number;

                    /** EllipseArgs radiusX. */
                    public radiusX: number;

                    /** EllipseArgs radiusY. */
                    public radiusY: number;

                    /**
                     * Creates a new EllipseArgs instance using the specified properties.
                     * @param [properties] Properties to set
                     * @returns EllipseArgs instance
                     */
                    public static create(properties?: com.opensource.svga.ShapeEntity.IEllipseArgs): com.opensource.svga.ShapeEntity.EllipseArgs;

                    /**
                     * Encodes the specified EllipseArgs message. Does not implicitly {@link com.opensource.svga.ShapeEntity.EllipseArgs.verify|verify} messages.
                     * @param message EllipseArgs message or plain object to encode
                     * @param [writer] Writer to encode to
                     * @returns Writer
                     */
                    public static encode(message: com.opensource.svga.ShapeEntity.IEllipseArgs, writer?: $protobuf.Writer): $protobuf.Writer;

                    /**
                     * Encodes the specified EllipseArgs message, length delimited. Does not implicitly {@link com.opensource.svga.ShapeEntity.EllipseArgs.verify|verify} messages.
                     * @param message EllipseArgs message or plain object to encode
                     * @param [writer] Writer to encode to
                     * @returns Writer
                     */
                    public static encodeDelimited(message: com.opensource.svga.ShapeEntity.IEllipseArgs, writer?: $protobuf.Writer): $protobuf.Writer;

                    /**
                     * Decodes an EllipseArgs message from the specified reader or buffer.
                     * @param reader Reader or buffer to decode from
                     * @param [length] Message length if known beforehand
                     * @returns EllipseArgs
                     * @throws {Error} If the payload is not a reader or valid buffer
                     * @throws {$protobuf.util.ProtocolError} If required fields are missing
                     */
                    public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): com.opensource.svga.ShapeEntity.EllipseArgs;

                    /**
                     * Decodes an EllipseArgs message from the specified reader or buffer, length delimited.
                     * @param reader Reader or buffer to decode from
                     * @returns EllipseArgs
                     * @throws {Error} If the payload is not a reader or valid buffer
                     * @throws {$protobuf.util.ProtocolError} If required fields are missing
                     */
                    public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): com.opensource.svga.ShapeEntity.EllipseArgs;

                    /**
                     * Verifies an EllipseArgs message.
                     * @param message Plain object to verify
                     * @returns `null` if valid, otherwise the reason why it is not
                     */
                    public static verify(message: { [k: string]: any }): (string|null);

                    /**
                     * Creates an EllipseArgs message from a plain object. Also converts values to their respective internal types.
                     * @param object Plain object
                     * @returns EllipseArgs
                     */
                    public static fromObject(object: { [k: string]: any }): com.opensource.svga.ShapeEntity.EllipseArgs;

                    /**
                     * Creates a plain object from an EllipseArgs message. Also converts values to other types if specified.
                     * @param message EllipseArgs
                     * @param [options] Conversion options
                     * @returns Plain object
                     */
                    public static toObject(message: com.opensource.svga.ShapeEntity.EllipseArgs, options?: $protobuf.IConversionOptions): { [k: string]: any };

                    /**
                     * Converts this EllipseArgs to JSON.
                     * @returns JSON object
                     */
                    public toJSON(): { [k: string]: any };

                    /**
                     * Gets the default type url for EllipseArgs
                     * @param [typeUrlPrefix] your custom typeUrlPrefix(default "type.googleapis.com")
                     * @returns The default type url
                     */
                    public static getTypeUrl(typeUrlPrefix?: string): string;
                }

                /** Properties of a ShapeStyle. */
                interface IShapeStyle {

                    /** ShapeStyle fill */
                    fill?: (com.opensource.svga.ShapeEntity.ShapeStyle.IRGBAColor|null);

                    /** ShapeStyle stroke */
                    stroke?: (com.opensource.svga.ShapeEntity.ShapeStyle.IRGBAColor|null);

                    /** ShapeStyle strokeWidth */
                    strokeWidth?: (number|null);

                    /** ShapeStyle lineCap */
                    lineCap?: (com.opensource.svga.ShapeEntity.ShapeStyle.LineCap|null);

                    /** ShapeStyle lineJoin */
                    lineJoin?: (com.opensource.svga.ShapeEntity.ShapeStyle.LineJoin|null);

                    /** ShapeStyle miterLimit */
                    miterLimit?: (number|null);

                    /** ShapeStyle lineDashI */
                    lineDashI?: (number|null);

                    /** ShapeStyle lineDashII */
                    lineDashII?: (number|null);

                    /** ShapeStyle lineDashIII */
                    lineDashIII?: (number|null);
                }

                /** Represents a ShapeStyle. */
                class ShapeStyle implements IShapeStyle {

                    /**
                     * Constructs a new ShapeStyle.
                     * @param [properties] Properties to set
                     */
                    constructor(properties?: com.opensource.svga.ShapeEntity.IShapeStyle);

                    /** ShapeStyle fill. */
                    public fill?: (com.opensource.svga.ShapeEntity.ShapeStyle.IRGBAColor|null);

                    /** ShapeStyle stroke. */
                    public stroke?: (com.opensource.svga.ShapeEntity.ShapeStyle.IRGBAColor|null);

                    /** ShapeStyle strokeWidth. */
                    public strokeWidth: number;

                    /** ShapeStyle lineCap. */
                    public lineCap: com.opensource.svga.ShapeEntity.ShapeStyle.LineCap;

                    /** ShapeStyle lineJoin. */
                    public lineJoin: com.opensource.svga.ShapeEntity.ShapeStyle.LineJoin;

                    /** ShapeStyle miterLimit. */
                    public miterLimit: number;

                    /** ShapeStyle lineDashI. */
                    public lineDashI: number;

                    /** ShapeStyle lineDashII. */
                    public lineDashII: number;

                    /** ShapeStyle lineDashIII. */
                    public lineDashIII: number;

                    /**
                     * Creates a new ShapeStyle instance using the specified properties.
                     * @param [properties] Properties to set
                     * @returns ShapeStyle instance
                     */
                    public static create(properties?: com.opensource.svga.ShapeEntity.IShapeStyle): com.opensource.svga.ShapeEntity.ShapeStyle;

                    /**
                     * Encodes the specified ShapeStyle message. Does not implicitly {@link com.opensource.svga.ShapeEntity.ShapeStyle.verify|verify} messages.
                     * @param message ShapeStyle message or plain object to encode
                     * @param [writer] Writer to encode to
                     * @returns Writer
                     */
                    public static encode(message: com.opensource.svga.ShapeEntity.IShapeStyle, writer?: $protobuf.Writer): $protobuf.Writer;

                    /**
                     * Encodes the specified ShapeStyle message, length delimited. Does not implicitly {@link com.opensource.svga.ShapeEntity.ShapeStyle.verify|verify} messages.
                     * @param message ShapeStyle message or plain object to encode
                     * @param [writer] Writer to encode to
                     * @returns Writer
                     */
                    public static encodeDelimited(message: com.opensource.svga.ShapeEntity.IShapeStyle, writer?: $protobuf.Writer): $protobuf.Writer;

                    /**
                     * Decodes a ShapeStyle message from the specified reader or buffer.
                     * @param reader Reader or buffer to decode from
                     * @param [length] Message length if known beforehand
                     * @returns ShapeStyle
                     * @throws {Error} If the payload is not a reader or valid buffer
                     * @throws {$protobuf.util.ProtocolError} If required fields are missing
                     */
                    public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): com.opensource.svga.ShapeEntity.ShapeStyle;

                    /**
                     * Decodes a ShapeStyle message from the specified reader or buffer, length delimited.
                     * @param reader Reader or buffer to decode from
                     * @returns ShapeStyle
                     * @throws {Error} If the payload is not a reader or valid buffer
                     * @throws {$protobuf.util.ProtocolError} If required fields are missing
                     */
                    public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): com.opensource.svga.ShapeEntity.ShapeStyle;

                    /**
                     * Verifies a ShapeStyle message.
                     * @param message Plain object to verify
                     * @returns `null` if valid, otherwise the reason why it is not
                     */
                    public static verify(message: { [k: string]: any }): (string|null);

                    /**
                     * Creates a ShapeStyle message from a plain object. Also converts values to their respective internal types.
                     * @param object Plain object
                     * @returns ShapeStyle
                     */
                    public static fromObject(object: { [k: string]: any }): com.opensource.svga.ShapeEntity.ShapeStyle;

                    /**
                     * Creates a plain object from a ShapeStyle message. Also converts values to other types if specified.
                     * @param message ShapeStyle
                     * @param [options] Conversion options
                     * @returns Plain object
                     */
                    public static toObject(message: com.opensource.svga.ShapeEntity.ShapeStyle, options?: $protobuf.IConversionOptions): { [k: string]: any };

                    /**
                     * Converts this ShapeStyle to JSON.
                     * @returns JSON object
                     */
                    public toJSON(): { [k: string]: any };

                    /**
                     * Gets the default type url for ShapeStyle
                     * @param [typeUrlPrefix] your custom typeUrlPrefix(default "type.googleapis.com")
                     * @returns The default type url
                     */
                    public static getTypeUrl(typeUrlPrefix?: string): string;
                }

                namespace ShapeStyle {

                    /** Properties of a RGBAColor. */
                    interface IRGBAColor {

                        /** RGBAColor r */
                        r?: (number|null);

                        /** RGBAColor g */
                        g?: (number|null);

                        /** RGBAColor b */
                        b?: (number|null);

                        /** RGBAColor a */
                        a?: (number|null);
                    }

                    /** Represents a RGBAColor. */
                    class RGBAColor implements IRGBAColor {

                        /**
                         * Constructs a new RGBAColor.
                         * @param [properties] Properties to set
                         */
                        constructor(properties?: com.opensource.svga.ShapeEntity.ShapeStyle.IRGBAColor);

                        /** RGBAColor r. */
                        public r: number;

                        /** RGBAColor g. */
                        public g: number;

                        /** RGBAColor b. */
                        public b: number;

                        /** RGBAColor a. */
                        public a: number;

                        /**
                         * Creates a new RGBAColor instance using the specified properties.
                         * @param [properties] Properties to set
                         * @returns RGBAColor instance
                         */
                        public static create(properties?: com.opensource.svga.ShapeEntity.ShapeStyle.IRGBAColor): com.opensource.svga.ShapeEntity.ShapeStyle.RGBAColor;

                        /**
                         * Encodes the specified RGBAColor message. Does not implicitly {@link com.opensource.svga.ShapeEntity.ShapeStyle.RGBAColor.verify|verify} messages.
                         * @param message RGBAColor message or plain object to encode
                         * @param [writer] Writer to encode to
                         * @returns Writer
                         */
                        public static encode(message: com.opensource.svga.ShapeEntity.ShapeStyle.IRGBAColor, writer?: $protobuf.Writer): $protobuf.Writer;

                        /**
                         * Encodes the specified RGBAColor message, length delimited. Does not implicitly {@link com.opensource.svga.ShapeEntity.ShapeStyle.RGBAColor.verify|verify} messages.
                         * @param message RGBAColor message or plain object to encode
                         * @param [writer] Writer to encode to
                         * @returns Writer
                         */
                        public static encodeDelimited(message: com.opensource.svga.ShapeEntity.ShapeStyle.IRGBAColor, writer?: $protobuf.Writer): $protobuf.Writer;

                        /**
                         * Decodes a RGBAColor message from the specified reader or buffer.
                         * @param reader Reader or buffer to decode from
                         * @param [length] Message length if known beforehand
                         * @returns RGBAColor
                         * @throws {Error} If the payload is not a reader or valid buffer
                         * @throws {$protobuf.util.ProtocolError} If required fields are missing
                         */
                        public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): com.opensource.svga.ShapeEntity.ShapeStyle.RGBAColor;

                        /**
                         * Decodes a RGBAColor message from the specified reader or buffer, length delimited.
                         * @param reader Reader or buffer to decode from
                         * @returns RGBAColor
                         * @throws {Error} If the payload is not a reader or valid buffer
                         * @throws {$protobuf.util.ProtocolError} If required fields are missing
                         */
                        public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): com.opensource.svga.ShapeEntity.ShapeStyle.RGBAColor;

                        /**
                         * Verifies a RGBAColor message.
                         * @param message Plain object to verify
                         * @returns `null` if valid, otherwise the reason why it is not
                         */
                        public static verify(message: { [k: string]: any }): (string|null);

                        /**
                         * Creates a RGBAColor message from a plain object. Also converts values to their respective internal types.
                         * @param object Plain object
                         * @returns RGBAColor
                         */
                        public static fromObject(object: { [k: string]: any }): com.opensource.svga.ShapeEntity.ShapeStyle.RGBAColor;

                        /**
                         * Creates a plain object from a RGBAColor message. Also converts values to other types if specified.
                         * @param message RGBAColor
                         * @param [options] Conversion options
                         * @returns Plain object
                         */
                        public static toObject(message: com.opensource.svga.ShapeEntity.ShapeStyle.RGBAColor, options?: $protobuf.IConversionOptions): { [k: string]: any };

                        /**
                         * Converts this RGBAColor to JSON.
                         * @returns JSON object
                         */
                        public toJSON(): { [k: string]: any };

                        /**
                         * Gets the default type url for RGBAColor
                         * @param [typeUrlPrefix] your custom typeUrlPrefix(default "type.googleapis.com")
                         * @returns The default type url
                         */
                        public static getTypeUrl(typeUrlPrefix?: string): string;
                    }

                    /** LineCap enum. */
                    enum LineCap {
                        LineCap_BUTT = 0,
                        LineCap_ROUND = 1,
                        LineCap_SQUARE = 2
                    }

                    /** LineJoin enum. */
                    enum LineJoin {
                        LineJoin_MITER = 0,
                        LineJoin_ROUND = 1,
                        LineJoin_BEVEL = 2
                    }
                }
            }

            /** Properties of a FrameEntity. */
            interface IFrameEntity {

                /** FrameEntity alpha */
                alpha?: (number|null);

                /** FrameEntity layout */
                layout?: (com.opensource.svga.ILayout|null);

                /** FrameEntity transform */
                transform?: (com.opensource.svga.ITransform|null);

                /** FrameEntity clipPath */
                clipPath?: (string|null);

                /** FrameEntity shapes */
                shapes?: (com.opensource.svga.IShapeEntity[]|null);
            }

            /** Represents a FrameEntity. */
            class FrameEntity implements IFrameEntity {

                /**
                 * Constructs a new FrameEntity.
                 * @param [properties] Properties to set
                 */
                constructor(properties?: com.opensource.svga.IFrameEntity);

                /** FrameEntity alpha. */
                public alpha: number;

                /** FrameEntity layout. */
                public layout?: (com.opensource.svga.ILayout|null);

                /** FrameEntity transform. */
                public transform?: (com.opensource.svga.ITransform|null);

                /** FrameEntity clipPath. */
                public clipPath: string;

                /** FrameEntity shapes. */
                public shapes: com.opensource.svga.IShapeEntity[];

                /**
                 * Creates a new FrameEntity instance using the specified properties.
                 * @param [properties] Properties to set
                 * @returns FrameEntity instance
                 */
                public static create(properties?: com.opensource.svga.IFrameEntity): com.opensource.svga.FrameEntity;

                /**
                 * Encodes the specified FrameEntity message. Does not implicitly {@link com.opensource.svga.FrameEntity.verify|verify} messages.
                 * @param message FrameEntity message or plain object to encode
                 * @param [writer] Writer to encode to
                 * @returns Writer
                 */
                public static encode(message: com.opensource.svga.IFrameEntity, writer?: $protobuf.Writer): $protobuf.Writer;

                /**
                 * Encodes the specified FrameEntity message, length delimited. Does not implicitly {@link com.opensource.svga.FrameEntity.verify|verify} messages.
                 * @param message FrameEntity message or plain object to encode
                 * @param [writer] Writer to encode to
                 * @returns Writer
                 */
                public static encodeDelimited(message: com.opensource.svga.IFrameEntity, writer?: $protobuf.Writer): $protobuf.Writer;

                /**
                 * Decodes a FrameEntity message from the specified reader or buffer.
                 * @param reader Reader or buffer to decode from
                 * @param [length] Message length if known beforehand
                 * @returns FrameEntity
                 * @throws {Error} If the payload is not a reader or valid buffer
                 * @throws {$protobuf.util.ProtocolError} If required fields are missing
                 */
                public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): com.opensource.svga.FrameEntity;

                /**
                 * Decodes a FrameEntity message from the specified reader or buffer, length delimited.
                 * @param reader Reader or buffer to decode from
                 * @returns FrameEntity
                 * @throws {Error} If the payload is not a reader or valid buffer
                 * @throws {$protobuf.util.ProtocolError} If required fields are missing
                 */
                public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): com.opensource.svga.FrameEntity;

                /**
                 * Verifies a FrameEntity message.
                 * @param message Plain object to verify
                 * @returns `null` if valid, otherwise the reason why it is not
                 */
                public static verify(message: { [k: string]: any }): (string|null);

                /**
                 * Creates a FrameEntity message from a plain object. Also converts values to their respective internal types.
                 * @param object Plain object
                 * @returns FrameEntity
                 */
                public static fromObject(object: { [k: string]: any }): com.opensource.svga.FrameEntity;

                /**
                 * Creates a plain object from a FrameEntity message. Also converts values to other types if specified.
                 * @param message FrameEntity
                 * @param [options] Conversion options
                 * @returns Plain object
                 */
                public static toObject(message: com.opensource.svga.FrameEntity, options?: $protobuf.IConversionOptions): { [k: string]: any };

                /**
                 * Converts this FrameEntity to JSON.
                 * @returns JSON object
                 */
                public toJSON(): { [k: string]: any };

                /**
                 * Gets the default type url for FrameEntity
                 * @param [typeUrlPrefix] your custom typeUrlPrefix(default "type.googleapis.com")
                 * @returns The default type url
                 */
                public static getTypeUrl(typeUrlPrefix?: string): string;
            }

            /** Properties of a MovieEntity. */
            interface IMovieEntity {

                /** MovieEntity version */
                version?: (string|null);

                /** MovieEntity params */
                params?: (com.opensource.svga.IMovieParams|null);

                /** MovieEntity images */
                images?: ({ [k: string]: Uint8Array }|null);

                /** MovieEntity sprites */
                sprites?: (com.opensource.svga.ISpriteEntity[]|null);

                /** MovieEntity audios */
                audios?: (com.opensource.svga.IAudioEntity[]|null);
            }

            /** Represents a MovieEntity. */
            class MovieEntity implements IMovieEntity {

                /**
                 * Constructs a new MovieEntity.
                 * @param [properties] Properties to set
                 */
                constructor(properties?: com.opensource.svga.IMovieEntity);

                /** MovieEntity version. */
                public version: string;

                /** MovieEntity params. */
                public params?: (com.opensource.svga.IMovieParams|null);

                /** MovieEntity images. */
                public images: { [k: string]: Uint8Array };

                /** MovieEntity sprites. */
                public sprites: com.opensource.svga.ISpriteEntity[];

                /** MovieEntity audios. */
                public audios: com.opensource.svga.IAudioEntity[];

                /**
                 * Creates a new MovieEntity instance using the specified properties.
                 * @param [properties] Properties to set
                 * @returns MovieEntity instance
                 */
                public static create(properties?: com.opensource.svga.IMovieEntity): com.opensource.svga.MovieEntity;

                /**
                 * Encodes the specified MovieEntity message. Does not implicitly {@link com.opensource.svga.MovieEntity.verify|verify} messages.
                 * @param message MovieEntity message or plain object to encode
                 * @param [writer] Writer to encode to
                 * @returns Writer
                 */
                public static encode(message: com.opensource.svga.IMovieEntity, writer?: $protobuf.Writer): $protobuf.Writer;

                /**
                 * Encodes the specified MovieEntity message, length delimited. Does not implicitly {@link com.opensource.svga.MovieEntity.verify|verify} messages.
                 * @param message MovieEntity message or plain object to encode
                 * @param [writer] Writer to encode to
                 * @returns Writer
                 */
                public static encodeDelimited(message: com.opensource.svga.IMovieEntity, writer?: $protobuf.Writer): $protobuf.Writer;

                /**
                 * Decodes a MovieEntity message from the specified reader or buffer.
                 * @param reader Reader or buffer to decode from
                 * @param [length] Message length if known beforehand
                 * @returns MovieEntity
                 * @throws {Error} If the payload is not a reader or valid buffer
                 * @throws {$protobuf.util.ProtocolError} If required fields are missing
                 */
                public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): com.opensource.svga.MovieEntity;

                /**
                 * Decodes a MovieEntity message from the specified reader or buffer, length delimited.
                 * @param reader Reader or buffer to decode from
                 * @returns MovieEntity
                 * @throws {Error} If the payload is not a reader or valid buffer
                 * @throws {$protobuf.util.ProtocolError} If required fields are missing
                 */
                public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): com.opensource.svga.MovieEntity;

                /**
                 * Verifies a MovieEntity message.
                 * @param message Plain object to verify
                 * @returns `null` if valid, otherwise the reason why it is not
                 */
                public static verify(message: { [k: string]: any }): (string|null);

                /**
                 * Creates a MovieEntity message from a plain object. Also converts values to their respective internal types.
                 * @param object Plain object
                 * @returns MovieEntity
                 */
                public static fromObject(object: { [k: string]: any }): com.opensource.svga.MovieEntity;

                /**
                 * Creates a plain object from a MovieEntity message. Also converts values to other types if specified.
                 * @param message MovieEntity
                 * @param [options] Conversion options
                 * @returns Plain object
                 */
                public static toObject(message: com.opensource.svga.MovieEntity, options?: $protobuf.IConversionOptions): { [k: string]: any };

                /**
                 * Converts this MovieEntity to JSON.
                 * @returns JSON object
                 */
                public toJSON(): { [k: string]: any };

                /**
                 * Gets the default type url for MovieEntity
                 * @param [typeUrlPrefix] your custom typeUrlPrefix(default "type.googleapis.com")
                 * @returns The default type url
                 */
                public static getTypeUrl(typeUrlPrefix?: string): string;
            }
        }
    }
}
